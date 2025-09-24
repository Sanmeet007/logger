import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/logs/logs_page.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/providers/shared_preferences_providers/call_log_count_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(currentCallLogsNotifierProvider);
    final showCallLogCount = ref.watch(callLogCountProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(callLogsNotifierProvider.notifier).hardRefresh();
        await ref.read(logsFilterProvider.notifier).reapply();
      },
      child: LogsPage(
        entries: entries,
        callLogCountVisibility: showCallLogCount,
      ),
    );
  }
}
