import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/call_duration.dart';
import 'package:logger/components/analytics/call_freq.dart';
import 'package:logger/components/analytics/call_stats.dart';
import 'package:logger/components/analytics/inc_out_tile.dart';
import 'package:logger/components/analytics/top_contacts_tile.dart';
import 'package:logger/utils/analytics_fns.dart';
import 'package:logger/utils/utils.dart';

class AnalyticsScreen extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  const AnalyticsScreen({super.key, required this.entries});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late final CallLogAnalyzer analyzer;

  @override
  void initState() {
    super.initState();

    analyzer = CallLogAnalyzer(logs: widget.entries ?? const Iterable.empty());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CallStatsTileBuilder(
              analyzer: analyzer,
            ),
            CallDurationTileBuilder(
              analyzer: analyzer,
            ),
            IncomingVsOutgoingTileBuilder(
              analyzer: analyzer,
            ),
            CallFreqTileBuilder(
              analyzer: analyzer,
            ),
            TopContactsTileBuilder(
              analyzer: analyzer,
            ),
          ],
        ),
      ),
    );
  }
}

class TopContactsTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;

  const TopContactsTileBuilder({
    super.key,
    required this.analyzer,
  });

  Future<List<CallLogEntry>> getValues() async {
    return Future(() async {
      var li = await analyzer.getTop5CallDurationEntries();
      return li;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading most and least frequent");
            default:
              if (snapshot.hasData) {
                var entries = snapshot.data as List<CallLogEntry>;
                return TopContactsTile(entries: entries);
              } else {
                return const Text("Hmm. Something went wrong");
              }
          }
        });
  }
}

class CallFreqTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;

  const CallFreqTileBuilder({
    super.key,
    required this.analyzer,
  });

  Future<List<CallLogEntryWithFreq>> getValues() async {
    return Future(() async {
      var li = await analyzer.getMaxLeastFrequentlyCalledEntries();
      return li;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading most and least frequent");
            default:
              if (snapshot.hasData) {
                var values = snapshot.data as List<CallLogEntryWithFreq>;
                return CallFreqTile(
                  mostFrequent: values[0],
                  leastFrequent: values[1],
                );
              } else {
                return const Text("Hmm. Something went wrong");
              }
          }
        });
  }
}

class IncomingVsOutgoingTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;

  const IncomingVsOutgoingTileBuilder({
    super.key,
    required this.analyzer,
  });

  Future<List<int>> getValues() async {
    return Future(() async {
      var inc = await analyzer.getIncomingCallTypeCount();
      var out = await analyzer.getOutgoingCallTypeCount();
      return [inc, out];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading incoming outgoing graph");
            default:
              if (snapshot.hasData) {
                var values = snapshot.data as List<int>;
                return IncomingVsOutgoingTile(
                  incomingCallsCount: values[0],
                  outgoingCallsCount: values[1],
                );
              } else {
                return const Text("Hmm. Something went wrong");
              }
          }
        });
  }
}

class CallDurationTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;

  const CallDurationTileBuilder({
    super.key,
    required this.analyzer,
  });

  Future<List<String>> getValues() async {
    return Future(() async {
      var avg = await analyzer.getAvgCallDuration();
      var longest = await analyzer.getLongestCallDuration();
      return [prettifyDuration(avg), prettifyDuration(longest)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading call duration data");
            default:
              if (snapshot.hasData) {
                return CallDurationTile(
                  labels: const ["Average", "Longest"],
                  values: snapshot.data as List<String>,
                );
              } else {
                return const Text("Hmm. Something went wrong");
              }
          }
        });
  }
}

class CallStatsTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;
  const CallStatsTileBuilder({super.key, required this.analyzer});

  Future<List<String>> getValues() async {
    return Future(() async {
      int rejectedCallsCount =
          await analyzer.getCallTypeCount(CallType.rejected);
      int outgoingCallsCount = await analyzer.getOutgoingCallTypeCount();
      int missedCallsCount = await analyzer.getCallTypeCount(CallType.missed);
      int blockedCallsCount = await analyzer.getCallTypeCount(CallType.blocked);

      return [
        outgoingCallsCount,
        rejectedCallsCount,
        missedCallsCount,
        blockedCallsCount
      ].map(prettifyNumbers).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading call stats");
            default:
              if (snapshot.hasData) {
                return CallStatsTile(labels: const [
                  "Calls Made",
                  "Calls Rejected",
                  "Calls Missed",
                  "Calls Blocked",
                ], values: snapshot.data as List<String>);
              } else {
                return const Text("Hmm. Something went wrong");
              }
          }
        });
  }
}
