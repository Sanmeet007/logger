import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:logger/utils/generate_files.dart';

final importTypeProvider =
    StateNotifierProvider<ImportTypeProvider, ImportFileType>((ref) {
  return ImportTypeProvider(ref: ref);
});

class ImportTypeProvider extends StateNotifier<ImportFileType> {
  ImportTypeProvider({required this.ref})
      : super(ref.watch(sharedUtilityProvider).getCurrentSelectedImportType());

  Ref ref;

  void setImportType(ImportFileType type) {
    ref.watch(sharedUtilityProvider).setImportType(type);
    state = type;
  }
}
