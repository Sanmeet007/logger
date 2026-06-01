import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class ExportFileNameFormatNotifier extends Notifier<String> {
  @override
  String build() {
    return ref.watch(sharedUtilityProvider).getExportFileNameFormat();
  }

  void setFormat(String format) {
    ref.read(sharedUtilityProvider).setExportFileNameFormat(format);
    state = format;
  }
}

final exportFileNameFormatProvider =
    NotifierProvider<ExportFileNameFormatNotifier, String>(
  ExportFileNameFormatNotifier.new,
);
