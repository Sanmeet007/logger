import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:logger/utils/file_types.dart';

final exportTypeProvider =
    StateNotifierProvider<ExportTypeProvider, FileType>((ref) {
  return ExportTypeProvider(ref: ref);
});

class ExportTypeProvider extends StateNotifier<FileType> {
  ExportTypeProvider({required this.ref})
      : super(ref.watch(sharedUtilityProvider).getCurrentSelectedExportType());

  Ref ref;

  void setExportType(FileType type) {
    ref.watch(sharedUtilityProvider).setExportType(type);
    state = type;
  }
}
