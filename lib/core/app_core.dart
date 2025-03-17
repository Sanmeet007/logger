import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/app_error.dart';
import 'package:logger/components/common/loader.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/shared_preferences_providers/onboarding_provider.dart';
import 'package:logger/screens/onboarding/screen.dart';
import 'package:logger/core/app_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppCore extends ConsumerWidget {
  final WidgetsBinding widgetsBinding;
  const AppCore({super.key, required this.widgetsBinding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnboardingComplete = ref.watch(onboardingProvider);

    if (!isOnboardingComplete) {
      return OnboardingScreen();
    } else {
      return AppInitializer();
    }
  }
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: [
        Permission.phone,
        Permission.contacts,
      ].request(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Loader();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              if (snapshot.data![Permission.phone] ==
                      PermissionStatus.granted &&
                  snapshot.data![Permission.contacts] ==
                      PermissionStatus.granted) {
                return RefreshableBuilder();
              } else {
                return AppError(
                  displayIcon: Icons.warning,
                  errorMessage:
                      AppLocalizations.of(context).appPermissionsDeniedError,
                );
              }
            } else if (snapshot.hasError) {
              return AppError(
                displayIcon: Icons.error,
                errorMessage: AppLocalizations.of(context).appError,
              );
            } else {
              return AppError(
                displayIcon: Icons.error,
                errorMessage: AppLocalizations.of(context).appFatalError,
              );
            }
        }
      },
    );
  }
}

class RefreshableBuilder extends ConsumerWidget {
  const RefreshableBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callLogState = ref.watch(callLogsNotifierProvider);

    return callLogState.when(
      loading: () => const Loader(),
      data: (_) => AppInterface(),
      error: (err, _) => AppError(
        displayIcon: Icons.error,
        errorMessage: AppLocalizations.of(context).appError,
      ),
    );
  }
}
