import 'package:material_ui/material_ui.dart';

TableRow buildTableField(String fieldName, String fieldValue) {
  return TableRow(children: [
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(fieldName),
      ),
    ),
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          fieldValue,
        ),
      ),
    ),
  ]);
}
