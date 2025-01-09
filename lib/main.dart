import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_interface.dart';
import 'package:device_preview/device_preview.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => AppPreviewWrapper(
        widgetsBinding: widgetsBinding,
      ),
    ),
  );
}

class AppPreviewWrapper extends StatelessWidget {
  final WidgetsBinding widgetsBinding;

  const AppPreviewWrapper({super.key, required this.widgetsBinding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Logger",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        ...AppLocalizations.supportedLocales,
      ],
      home: Application(widgetsBinding: widgetsBinding),
    );
  }
}
