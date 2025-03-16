import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/call_duration.dart';
import 'package:logger/components/analytics/call_freq.dart';
import 'package:logger/components/analytics/call_stats.dart';
import 'package:logger/components/analytics/inc_out_tile.dart';
import 'package:logger/components/analytics/top_contacts_tile.dart';
import 'package:logger/components/common/grid_skeleton.dart';
import 'package:logger/components/common/skeleton.dart';
import 'package:logger/utils/analytics_fns.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CallFreqType { received, called }

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
              CallType.incoming,
              CallType.wifiOutgoing,
              CallType.wifiIncoming,
            ]))
              CallDurationTileBuilder(
                showTotalCallDuration: showTotalCallDuration,
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
                freqType: CallFreqType.called,
                analyzer: analyzer,
              ),
            if (containsAnyMatchingCallTypes([
              CallType.incoming,
              CallType.wifiIncoming,
            ]))
              CallFreqTileBuilder(
                freqType: CallFreqType.received,
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
  final CallFreqType freqType;

  const CallFreqTileBuilder({
    super.key,
    required this.analyzer,
    required this.freqType,
  });

  Future<CallLogEntryWithFreq?> getValues() async {
    return Future(() async {
      if (freqType == CallFreqType.called) {
        return await analyzer.getMaxFrequentlyCalledEntry();
      } else {
        return await analyzer.getMaxFrequentlyReceivedEntry();
      }
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
                  freqType: freqType,
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
                return Text(
                  AppLocalizations.of(context).ghostErrorMessage,
                );
              }
          }
        });
  }
}

class CallDurationTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;
  final bool showTotalCallDuration;

  const CallDurationTileBuilder({
    super.key,
    required this.analyzer,
    this.showTotalCallDuration = false,
  });

  Future<List<String>> getValues(BuildContext context) async {
    return Future(() async {
      var avg = await analyzer.getAvgCallDuration();
      var longest = await analyzer.getLongestCallDuration();
      var total = await analyzer.getTotalCallDuration();
      if (context.mounted) {
        if (showTotalCallDuration) {
          return [
            FromatHelpers.prettifyDuration(avg, context),
            FromatHelpers.prettifyDuration(longest, context),
            FromatHelpers.prettifyDuration(total, context),
          ];
        } else {
          return [
            FromatHelpers.prettifyDuration(avg, context),
            FromatHelpers.prettifyDuration(longest, context),
          ];
        }
      } else {
        return [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(context),
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
                  labels: showTotalCallDuration
                      ? [
                          AppLocalizations.of(context).averageText,
                          AppLocalizations.of(context).longestText,
                          AppLocalizations.of(context).totalText,
                        ]
                      : [
                          AppLocalizations.of(context).averageText,
                          AppLocalizations.of(context).longestText,
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

class CallStatsTileBuilder extends StatelessWidget {
  final CallLogAnalyzer analyzer;
  const CallStatsTileBuilder({super.key, required this.analyzer});

  Future<List<String>> getValues(BuildContext context) async {
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
      ].map((x) => FromatHelpers.prettifyNumbers(x, context)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: getValues(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return GridSkeleton(
                  childAspectRatio:
                      MediaQuery.of(context).size.width <= 350 ? 2.5 : 1.5,
                  crossAxisCount:
                      MediaQuery.of(context).size.width <= 350 ? 1 : 2,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 64, 58, 72)
                      : const Color.fromARGB(255, 240, 230, 255));
            default:
              if (snapshot.hasData) {
                return CallStatsTile(
                  labels: [
                    AppLocalizations.of(context).callsMadeText,
                    AppLocalizations.of(context).callsRejectedText,
                    AppLocalizations.of(context).callsMissedText,
                    AppLocalizations.of(context).callsBlockedText,
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
