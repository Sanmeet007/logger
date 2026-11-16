import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/custom_circular_progress.dart';
import 'package:logger/components/common/custom_linear_progress_loader.dart';
import 'package:logger/providers/linear_loader_provider.dart';
import 'package:logger/providers/loader_provider.dart';
import 'package:logger/screens/analytics/screen.dart';
import 'package:logger/screens/home/screen.dart';
import 'package:logger/screens/settings/screen.dart';
import 'package:logger/core/manager.dart';
import 'package:logger/l10n/app_localizations.dart';
import 'package:logger/screens/tracklist/screen.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

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
              icon: PhosphorIcons.phone,
              selectedIcon: PhosphorIcons.phoneFill,
              screen: HomeScreen(),
            ),
            Screen(
              index: 1,
              label: AppLocalizations.of(context).analyticsScreenLabelText,
              icon: PhosphorIcons.chartBar,
              selectedIcon: PhosphorIcons.chartBarFill,
              screen: AnalyticsScreen(),
            ),
            Screen(
              label: AppLocalizations.of(context).trackListLabelText,
              index: 2,
              icon: PhosphorIcons.listBullets,
              selectedIcon: PhosphorIcons.listBulletsFill,
              screen: TrackListScreen(),
            ),
            Screen(
              label: AppLocalizations.of(context).settingsScreenLabelText,
              index: 3,
              icon: PhosphorIcons.gear,
              selectedIcon: PhosphorIcons.gearFill,
              screen: SettingsScreen(),
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
