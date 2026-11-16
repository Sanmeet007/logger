import 'package:material_ui/material_ui.dart';

class DeviceInfo {
  static String getDeviceType(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return (width < 500) ? 'phone' : 'tablet';
  }

  static bool isTabView(BuildContext context) {
    return getDeviceType(context) == "tablet";
  }

  static bool isLargestView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return (width > 1000);
  }
}
