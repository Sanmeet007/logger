import 'package:flutter/material.dart';

buildTableField(String fieldName, String fieldValue) {
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
