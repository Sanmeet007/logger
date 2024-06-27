import 'package:call_log/call_log.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/call_duration.dart';
import 'package:logger/components/analytics/call_freq.dart';
import 'package:logger/components/analytics/call_stats.dart';
import 'package:logger/components/analytics/inc_out_tile.dart';
import 'package:logger/components/analytics/top_contacts_tile.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/utils/analytics_fns.dart';

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
            const CallStatsTile(),
            const CallDurationTile(),
            const IncomingVsOutgoingTile(),
            const CallFreqTile(),
            const TopContactsTile(),
          ],
        ),
      ),
    );
  }
}
