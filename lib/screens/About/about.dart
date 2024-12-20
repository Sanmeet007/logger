import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedText(
                "Software Information",
                size: 20.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(115, 53, 52, 52)
                        : const Color.fromARGB(255, 249, 245, 255),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Table(
                  border: TableBorder.symmetric(
                    inside: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(115, 53, 52, 52)
                          : const Color.fromARGB(201, 233, 216, 255),
                    ),
                  ),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.versionText,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getVersion(),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.platformText,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.platformNameText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedText(
                AppLocalizations.of(context)!.storagePolicyLabelText,
                size: 20.0,
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  AppLocalizations.of(context)!.storagePolicyText,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedText(
                AppLocalizations.of(context)!.analyticsPolicyLabelText,
                size: 20.0,
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  AppLocalizations.of(context)!.analyticsPolicyText,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      url_launcher.launchUrl(getRepoLink());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .exploreProjectButtonText,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.launch,
                            size: 15.0,
                          ),
                        ]),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.transparent,
                      elevation: WidgetStateProperty.all(0.0),
                    ),
                    onPressed: () {
                      url_launcher.launchUrl(getReportLink());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.reportIssueButtonText,
                      style: const TextStyle(
                        decorationColor: Color.fromARGB(255, 138, 138, 138),
                        color: Color.fromARGB(255, 138, 138, 138),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
