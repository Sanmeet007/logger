import 'package:flutter/material.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> openWhatsApp(BuildContext context, String phoneNumber) async {
  try {
    final url = "https://wa.me/$phoneNumber";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).waLaunchError,
        );
      }
    }
  } catch (_) {
    if (context.mounted) {
      AppSnackBar.show(
        context,
        content: AppLocalizations.of(context).waLaunchError,
      );
    }
  }
}
