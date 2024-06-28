import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

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
  List options = [
    {
      'title': 'Missed',
      'isActive': false,
      'value': CallType.missed,
    },
    {
      'title': 'Rejected',
      'isActive': false,
      'value': CallType.rejected,
    },
    {
      'title': 'Incoming',
      'isActive': false,
      'value': CallType.incoming,
    },
    {
      'title': 'Outgoing',
      'isActive': false,
      'value': CallType.outgoing,
    },
    {
      'title': 'Answered Externally',
      'isActive': false,
      'value': CallType.answeredExternally
    },
    {
      'title': 'Blocked',
      'isActive': false,
      'value': CallType.blocked,
    },
    {
      'title': 'Wifi Incoming',
      'isActive': false,
      'value': CallType.wifiIncoming,
    },
    {
      'title': 'Wifi Outgoing',
      'isActive': false,
      'value': CallType.wifiOutgoing,
    },
    {
      'title': 'Voice Mail',
      'isActive': false,
      'value': CallType.voiceMail,
    },
    {
      'title': 'Uknown',
      'isActive': false,
      'value': CallType.unknown,
    },
  ];

  @override
  void initState() {
    super.initState();
    for (var item in options) {
      if (widget.selectedCallTypes.contains(item["value"])) {
        item["isActive"] = true;
      } else {
        item["isActive"] = false;
      }
    }
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
        color: const Color.fromARGB(255, 108, 85, 139),
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
