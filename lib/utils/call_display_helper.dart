import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CallDisplayHelper {
  static final defaultDateFormatter = DateFormat("yyyy-MM-dd");

  static List getCallDisplayFields(CallType callType, BuildContext context) {
    String rCallType;
    late Color callColor;
    late IconData callIcon;

    if (callType == CallType.missed) {
      rCallType = AppLocalizations.of(context).missedText;
      callColor = Colors.redAccent;
      callIcon = Icons.call_missed;
    } else if (callType == CallType.incoming) {
      rCallType = AppLocalizations.of(context).incomingText;
      callColor = Colors.blue;
      callIcon = Icons.call_received;
    } else if (callType == CallType.outgoing) {
      rCallType = AppLocalizations.of(context).outgoingText;
      callColor = const Color.fromARGB(255, 175, 121, 255);
      callIcon = Icons.call_made;
    } else if (callType == CallType.blocked) {
      rCallType = AppLocalizations.of(context).blockedText;
      callColor = Colors.orange;
      callIcon = Icons.block;
    } else if (callType == CallType.rejected) {
      rCallType = AppLocalizations.of(context).rejectedText;
      callColor = Colors.red;
      callIcon = Icons.cancel_outlined;
    } else if (callType == CallType.wifiIncoming) {
      rCallType = AppLocalizations.of(context).wifiIncomingText;
      callColor = const Color.fromARGB(255, 110, 113, 255);
      callIcon = Icons.call_received;
    } else if (callType == CallType.wifiOutgoing) {
      rCallType = AppLocalizations.of(context).wifiOutgoingText;
      callColor = const Color.fromARGB(255, 110, 110, 255);
      callIcon = Icons.call_made;
    } else {
      rCallType = callType.toString().replaceAll("CallType.", "");
      rCallType =
          "${rCallType[0].toUpperCase()}${rCallType.substring(1).toLowerCase()}";
      callColor = Colors.grey;
      callIcon = Icons.call;
    }
    return [callColor, callIcon, rCallType];
  }

  static bool isUnknownContact(CallLogEntry entry) {
    bool isUnknown = true;

    String name = entry.name ?? "";

    if (name.isEmpty) {
      isUnknown = true;
    } else {
      isUnknown = false;
    }

    return isUnknown;
  }
}
