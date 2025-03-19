import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/datasource/filter_preset_provider.dart';
import 'package:logger/data/repostiory/presets_repository.dart';

final filterPresetsRepositoryProvider = Provider<PresetsRepository>((ref) {
  final datasource = ref.read(filterPresetsDatasourceProvider);
  return PresetsRepository(datasource);
});
