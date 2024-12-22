import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/analytics/indicator.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IncomingVsOutgoingTile extends StatelessWidget {
  final double spacing;
  final int incomingCallsCount, outgoingCallsCount;
  const IncomingVsOutgoingTile({
    super.key,
    required this.incomingCallsCount,
    required this.outgoingCallsCount,
    this.spacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    if (incomingCallsCount == 0 && outgoingCallsCount == 0) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedText(
          AppLocalizations.of(context).callDirectionAnalysisText,
          size: 20.0,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(250, 42, 40, 40)
                : const Color.fromARGB(155, 240, 230, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Indicator(
                    text: AppLocalizations.of(context).outgoingText,
                    color: const Color.fromARGB(255, 175, 121, 255),
                    isSquare: false,
                    size: 16,
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  Indicator(
                    color: Colors.blue,
                    text: AppLocalizations.of(context).incomingText,
                    isSquare: false,
                    size: 16,
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              AspectRatio(
                aspectRatio: 1.3,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        prettifyNumbers(
                            incomingCallsCount + outgoingCallsCount, context),
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: incomingCallsCount.toDouble(),
                            title: prettifyNumbers(incomingCallsCount, context),
                            color: Colors.blue,
                          ),
                          PieChartSectionData(
                            value: outgoingCallsCount.toDouble(),
                            title: prettifyNumbers(outgoingCallsCount, context),
                            color: const Color.fromARGB(255, 175, 121, 255),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}
