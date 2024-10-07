import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/call_duration.dart';
import 'package:logger/components/analytics/call_freq.dart';
import 'package:logger/components/analytics/call_stats.dart';
import 'package:logger/components/analytics/inc_out_tile.dart';
import 'package:logger/components/analytics/top_contacts_tile.dart';
import 'package:logger/components/grid_skeleton.dart';
import 'package:logger/components/skeleton.dart';
import 'package:logger/utils/analytics_fns.dart';
import 'package:logger/utils/utils.dart';

class AnalyticsScreen extends StatelessWidget {
  final Iterable<CallLogEntry>? entries;
  final CallLogAnalyzer analyzer;
  final List<CallType> currentCallTypes;
  final bool showTotalCallDuration;

  const AnalyticsScreen({
    super.key,
    required this.entries,
    required this.analyzer,
    required this.currentCallTypes,
    required this.showTotalCallDuration,
  });

  bool containsAnyMatchingCallTypes(List<CallType> types) {
    for (var t in currentCallTypes) {
      if (types.contains(t)) {
        return true;
      }
    }
    return false;
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
            if (containsAnyMatchingCallTypes([
              CallType.outgoing,
              CallType.wifiOutgoing,
            ]))
              CallDurationTileBuilder(
                analyzer: analyzer,
              ),
            if (containsAnyMatchingCallTypes([
              CallType.incoming,
              CallType.outgoing,
              CallType.wifiIncoming,
              CallType.wifiOutgoing,
            ]))
              IncomingVsOutgoingTileBuilder(
                analyzer: analyzer,
              ),
            if (containsAnyMatchingCallTypes([
              CallType.outgoing,
              CallType.wifiOutgoing,
            ]))
              CallFreqTileBuilder(
                analyzer: analyzer,
              ),
            if (containsAnyMatchingCallTypes([
              CallType.incoming,
              CallType.outgoing,
              CallType.wifiIncoming,
              CallType.wifiOutgoing,
            ]))
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
              return Skeleton(
                height: 300.0,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 64, 58, 72)
                    : const Color.fromARGB(255, 240, 230, 255),
              );
            default:
              if (snapshot.hasData) {
                var entries = snapshot.data as List<CallLogEntry>;
                return TopContactsTile(entries: entries);
              } else {
                return Container();
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

  Future<CallLogEntryWithFreq?> getValues() async {
    return Future(() async {
      return await analyzer.getMaxFrequentlyCalledEntry();
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
              return Skeleton(
                  height: 100.0,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 64, 58, 72)
                      : const Color.fromARGB(255, 240, 230, 255));
            default:
              if (snapshot.hasData) {
                var entry = snapshot.data;
                return CallFreqTile(
                  mostFrequent: entry,
                );
              } else {
                return Container();
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
              return Skeleton(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 64, 58, 72)
                      : const Color.fromARGB(255, 240, 230, 255));
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
              return Skeleton(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  height: 100.0,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 64, 58, 72)
                      : const Color.fromARGB(255, 240, 230, 255));
            default:
              if (snapshot.hasData) {
                return CallDurationTile(
                  labels: const ["Average", "Longest"],
                  values: snapshot.data as List<String>,
                );
              } else {
                return Container();
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
              return GridSkeleton(
                  childAspectRatio: 1.4,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 64, 58, 72)
                      : const Color.fromARGB(255, 240, 230, 255));
            default:
              if (snapshot.hasData) {
                return CallStatsTile(
                  labels: const [
                    "Calls Made",
                    "Calls Rejected",
                    "Calls Missed",
                    "Calls Blocked",
                  ],
                  icons: const [
                    Icon(
                      Icons.call_made,
                      color: Color.fromARGB(255, 124, 70, 204),
                    ),
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.redAccent,
                    ),
                    Icon(
                      Icons.call_missed,
                      color: Colors.red,
                    ),
                    Icon(
                      Icons.block,
                      color: Colors.orangeAccent,
                    ),
                  ],
                  values: snapshot.data as List<String>,
                );
              } else {
                return Container();
              }
          }
        });
  }
}
