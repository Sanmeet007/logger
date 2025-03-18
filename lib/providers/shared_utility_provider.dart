import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/utils/exported_filename_formatter.dart';
import 'package:logger/utils/file_types.dart';
import 'package:logger/utils/generate_files.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/utils/constants.dart' as constants;

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isOnboardingComplete() {
    return sharedPreferences.getBool(constants.sharedOnboardingKey) ?? false;
  }

  void markOnboardingComplete() {
    sharedPreferences.setBool(constants.sharedOnboardingKey, true);
  }

  bool isCallLogCountVisible() {
    return sharedPreferences.getBool(constants.sharedDisplayCallLogCountKey) ??
        false;
  }

  void toggleCallLogCountVisibility(bool newState) {
    sharedPreferences.setBool(constants.sharedDisplayCallLogCountKey, newState);
  }

  bool isPhoneAccountIdFilteringEnabled() {
    return sharedPreferences
            .getBool(constants.sharedPhoneAccountIdFilteringKey) ??
        false;
  }

  void togglePhoneAccountIdFiltering(bool newState) {
    sharedPreferences.setBool(
        constants.sharedPhoneAccountIdFilteringKey, newState);
  }

  bool isDurationFilteringEnabled() {
    return sharedPreferences.getBool(constants.sharedDurationFilteringKey) ??
        false;
  }

  void toggleDurationFiltering(bool newState) {
    sharedPreferences.setBool(constants.sharedDurationFilteringKey, newState);
  }

  bool isConfirmDownloadEnabled() {
    return sharedPreferences.getBool(constants.sharedConfirmDownloadKey) ??
        false;
  }

  void toggleConfirmDownload(bool newState) {
    sharedPreferences.setBool(constants.sharedConfirmDownloadKey, newState);
  }

  bool isTotalCallDurationEnabled() {
    return sharedPreferences
            .getBool(constants.sharedDisplayTotalCallDurationKey) ??
        false;
  }

  void toggleTotalCallDuration(bool newState) {
    sharedPreferences.setBool(
        constants.sharedDisplayTotalCallDurationKey, newState);
  }

  bool isLogsSharingEnabled() {
    return sharedPreferences.getBool(constants.sharedLogsSharingKey) ?? false;
  }

  void toggleLogsSharing(bool newState) {
    sharedPreferences.setBool(constants.sharedLogsSharingKey, newState);
  }

  FileType getCurrentSelectedExportType() {
    String s = sharedPreferences.getString(constants.sharedExportTypeKey) ??
        CallLogsFileGenerator.defaultImportType.name;

    return FileType.values.firstWhere(
      (e) => e.name == s,
      orElse: () => FileType.csv,
    );
  }

  void setExportType(FileType t) {
    sharedPreferences.setString(constants.sharedExportTypeKey, t.name);
  }

  String getExportFileNameFormat() {
    return sharedPreferences
            .getString(constants.sharedExportFileNameFormatKey) ??
        ExportedFilenameFormatHelper.defaultFormat;
  }

  void setExportFileNameFormat(String s) {
    sharedPreferences.setString(constants.sharedExportFileNameFormatKey, s);
  }
}
