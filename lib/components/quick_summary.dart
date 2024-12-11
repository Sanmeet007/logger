import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/call_stats.dart';
import 'package:logger/components/grid_skeleton.dart';
import 'package:logger/utils/analytics_fns.dart';
import 'package:logger/utils/utils.dart';

class QuickLogSummary extends StatelessWidget {
  final Iterable<CallLogEntry> logs;
  const QuickLogSummary({super.key, required this.logs});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            QuickSummaryStatsTileBuilder(
              logs: logs,
            ),
          ],
        ),
      ),
    );
  }
}

class QuickSummaryStatsTileBuilder extends StatefulWidget {
  final Iterable<CallLogEntry> logs;
  const QuickSummaryStatsTileBuilder({super.key, required this.logs});

  @override
  State<QuickSummaryStatsTileBuilder> createState() =>
      _QuickSummaryStatsTileBuilderState();
}

class _QuickSummaryStatsTileBuilderState
    extends State<QuickSummaryStatsTileBuilder> {
  late final Future values;

  @override
  void initState() {
    values = getValues();
    super.initState();
  }

  Future<List<String>> getValues() async {
    final analyzer = CallLogAnalyzer(logs: widget.logs);
    return Future(() async {
      int rejectedCallsCount =
          await analyzer.getCallTypeCount(CallType.rejected);
      int outgoingCallsCount = await analyzer.getOutgoingCallTypeCount();
      int missedCallsCount = await analyzer.getCallTypeCount(CallType.missed);
      int incomingCallsCount =
          await analyzer.getCallTypeCount(CallType.incoming);

      return [
        outgoingCallsCount,
        incomingCallsCount,
        missedCallsCount,
        rejectedCallsCount,
      ].map(prettifyNumbers).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: null,
        future: values,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return GridSkeleton(
                  useTitle: false,
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
                  showTitle: false,
                  labels: const [
                    "Calls Made",
                    "Calls Received",
                    "Calls Missed",
                    "Calls Rejected",
                  ],
                  icons: const [
                    Icon(
                      Icons.call_made,
                      color: Color.fromARGB(255, 124, 70, 204),
                    ),
                    Icon(
                      Icons.call_received,
                      color: Color.fromARGB(255, 70, 204, 200),
                    ),
                    Icon(
                      Icons.call_missed,
                      color: Colors.red,
                    ),
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.redAccent,
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
