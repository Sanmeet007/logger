import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_core.dart';
import 'themeing/theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final sharedPreferences = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MaterialApp(
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
        home: AppCore(
          widgetsBinding: widgetsBinding,
        ),
      ),
    ),
  );
}
