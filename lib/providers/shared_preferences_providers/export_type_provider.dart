import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:logger/utils/file_types.dart';

class ExportTypeNotifier extends Notifier<FileType> {
  @override
  FileType build() {
    return ref.watch(sharedUtilityProvider).getCurrentSelectedExportType();
  }

  void setExportType(FileType type) {
    ref.read(sharedUtilityProvider).setExportType(type);
    state = type;
  }
}

final exportTypeProvider = NotifierProvider<ExportTypeNotifier, FileType>(
  ExportTypeNotifier.new,
);
