import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/logs/logs.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(currentCallLogsNotifierProvider);
    final showCallLogCount =
        ref.watch(sharedUtilityProvider).isCallLogCountVisible();

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(callLogsNotifierProvider.notifier).hardRefresh();
      },
      child: LogsPage(
        entries: entries,
        callLogCountVisibility: showCallLogCount,
      ),
    );
  }
}
