import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/datasource/filter_preset_datasource.dart';

final filterPresetsDatasourceProvider = Provider<FilterPresetDatasource>((ref) {
  return FilterPresetDatasource();
});
