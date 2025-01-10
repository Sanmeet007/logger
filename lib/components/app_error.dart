import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppError extends StatelessWidget {
  final IconData displayIcon;
  final String errorMessage;

  const AppError(
      {super.key, required this.displayIcon, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context).appError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
