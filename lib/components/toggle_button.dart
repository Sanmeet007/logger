import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomToggleButtons extends StatefulWidget {
  final List<CallType> selectedCallTypes;
  final Function(CallType, bool) onChange;
  const CustomToggleButtons({
    super.key,
    required this.selectedCallTypes,
    required this.onChange,
  });

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List options = [];

  void initOptions(BuildContext context) {
    options = [
      {
        'title': AppLocalizations.of(context).missedText,
        'isActive': false,
        'value': CallType.missed,
      },
      {
        'title': AppLocalizations.of(context).rejectedText,
        'isActive': false,
        'value': CallType.rejected,
      },
      {
        'title': AppLocalizations.of(context).incomingText,
        'isActive': false,
        'value': CallType.incoming,
      },
      {
        'title': AppLocalizations.of(context).outgoingText,
        'isActive': false,
        'value': CallType.outgoing,
      },
      {
        'title': AppLocalizations.of(context).answeredExternallyText,
        'isActive': false,
        'value': CallType.answeredExternally
      },
      {
        'title': AppLocalizations.of(context).blockedText,
        'isActive': false,
        'value': CallType.blocked,
      },
      {
        'title': AppLocalizations.of(context).wifiIncomingText,
        'isActive': false,
        'value': CallType.wifiIncoming,
      },
      {
        'title': AppLocalizations.of(context).wifiOutgoingText,
        'isActive': false,
        'value': CallType.wifiOutgoing,
      },
      {
        'title': AppLocalizations.of(context).voiceMailText,
        'isActive': false,
        'value': CallType.voiceMail,
      },
      {
        'title': AppLocalizations.of(context).unknownText,
        'isActive': false,
        'value': CallType.unknown,
      },
    ];
    for (var item in options) {
      if (widget.selectedCallTypes.contains(item["value"])) {
        item["isActive"] = true;
      } else {
        item["isActive"] = false;
      }
    }

    // Updating state to reflect changes
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initOptions(context));
  }

  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
      widget.onChange(item["value"], item["isActive"]);
    });
  }

  customBoxDecorationLight(isActive) {
    return BoxDecoration(
      color: isActive
          ? const Color.fromARGB(255, 216, 189, 255)
          : Colors.transparent,
      border: Border.all(
        color: isActive
            ? const Color.fromARGB(255, 196, 155, 255)
            : const Color.fromARGB(101, 31, 3, 70),
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  customBoxDecorationDark(isActive) {
    return BoxDecoration(
      color: isActive
          ? const Color.fromARGB(255, 186, 169, 210)
          : const Color.fromARGB(255, 44, 43, 43),
      border: Border.all(
        color: isActive
            ? const Color.fromARGB(255, 101, 79, 132)
            : const Color.fromARGB(255, 72, 72, 72),
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: options
          .map(
            (option) => Container(
              clipBehavior: Clip.hardEdge,
              decoration: Theme.of(context).brightness == Brightness.dark
                  ? customBoxDecorationDark(option['isActive'])
                  : customBoxDecorationLight(option['isActive']),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    changeState(option);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${option['title']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: option['isActive']
                            ? Theme.of(context).brightness == Brightness.dark
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : const Color.fromARGB(255, 21, 0, 52)
                            : Theme.of(context).brightness == Brightness.dark
                                ? const Color.fromARGB(221, 165, 165, 165)
                                : const Color.fromARGB(255, 31, 3, 70),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
