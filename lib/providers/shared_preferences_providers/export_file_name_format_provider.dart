import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final exportFileNameFormatProvider =
    StateNotifierProvider<ExportFileNameFormatProvider, String>((ref) {
  return ExportFileNameFormatProvider(ref: ref);
});

class ExportFileNameFormatProvider extends StateNotifier<String> {
  ExportFileNameFormatProvider({required this.ref})
      : super(ref.watch(sharedUtilityProvider).getExportFileNameFormat());

  Ref ref;

  void setFormat(String format) {
    ref.watch(sharedUtilityProvider).setExportFileNameFormat(format);
    state = format;
  }
}
