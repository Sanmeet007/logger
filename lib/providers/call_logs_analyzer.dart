import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/utils/analytics_fns.dart';

class CallLogAnalysisNotifier extends Notifier<CallLogAnalyzer> {
  @override
  CallLogAnalyzer build() {
    final logs = ref.watch(currentCallLogsNotifierProvider);
    return CallLogAnalyzer(logs: logs);
  }
}

final callLogAnalysisProvider =
    NotifierProvider<CallLogAnalysisNotifier, CallLogAnalyzer>(
  CallLogAnalysisNotifier.new,
);
