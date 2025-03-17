import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/custom_circular_progress.dart';
import 'package:logger/components/common/custom_linear_progress_loader.dart';
import 'package:logger/providers/linear_loader_provider.dart';
import 'package:logger/providers/loader_provider.dart';
import 'package:logger/screens/about/screen.dart';
import 'package:logger/screens/analytics/screen.dart';
import 'package:logger/screens/home/screen.dart';
import 'package:logger/screens/settings/screen.dart';
import 'package:logger/core/manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppInterface extends ConsumerWidget {
  const AppInterface({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        ScreenManager(
          initialIndex: 0,
          items: <Screen>[
            Screen(
              index: 0,
              label: AppLocalizations.of(context).logsScreenLabelText,
              icon: Icons.call_outlined,
              selectedIcon: Icons.call,
              screen: HomeScreen(),
            ),
            Screen(
              index: 1,
              label: AppLocalizations.of(context).analyticsScreenLabelText,
              icon: Icons.pie_chart_outline,
              selectedIcon: Icons.pie_chart,
              screen: AnalyticsScreen(),
            ),
            Screen(
              label: AppLocalizations.of(context).settingsScreenLabelText,
              index: 2,
              icon: Icons.settings_outlined,
              selectedIcon: Icons.settings,
              screen: SettingsScreen(),
            ),
            Screen(
              label: AppLocalizations.of(context).aboutText,
              index: 3,
              icon: Icons.info_outline,
              selectedIcon: Icons.info,
              screen: const AboutScreen(),
            ),
          ],
        ),
        if (ref.watch(linearLoaderProvider).currentState)
          CustomLinearProgressLoader(
            linearLoaderText: ref.watch(linearLoaderProvider).message,
          ),
        if (ref.watch(loaderProvider)) CustomCircularProgress(),
      ],
    );
  }
}
