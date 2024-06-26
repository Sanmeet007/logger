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

  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: isActive
          ? const Color.fromARGB(255, 186, 169, 210)
          : const Color.fromARGB(255, 44, 43, 43),
      border: const Border(
          left: BorderSide(color: Colors.black12, width: 1.0),
          bottom: BorderSide(color: Colors.black12, width: 1.0),
          top: BorderSide(color: Colors.black12, width: 1.0),
          right: BorderSide(color: Colors.black12, width: 1.0)),
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
              decoration: customBoxDecoration(option['isActive']),
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
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : const Color.fromARGB(221, 165, 165, 165),
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
