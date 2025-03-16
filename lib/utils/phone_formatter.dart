import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneFormatter {
  static String parsePhoneNumber(String phnum) {
    if (phnum.isEmpty) {
      return phnum;
    }
    if (phnum.startsWith("+")) {
      var parseNumber = PhoneNumber.parse(phnum);
      return phnum.replaceAll("+${parseNumber.countryCode}", "");
    } else {
      return phnum;
    }
  }

  static String shrinkPhoneAccountID(String input) {
    if (input.length > 10) {
      return '${input.substring(0, 3)}...${input.substring(input.length - 3)}';
    } else {
      return input;
    }
  }
}
