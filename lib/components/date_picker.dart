import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoggerDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String fieldTitle;
  final DateTime firstDate, lastDate;
  final String dateMask;
  final String languageCode;

  const LoggerDatePicker({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.fieldTitle,
    required this.firstDate,
    required this.lastDate,
    required this.languageCode,
    this.dateMask = "EEEE, dd MMMM yyyy",
  });

  @override
  State<LoggerDatePicker> createState() => _LoggerDatePickerState();
}

class _LoggerDatePickerState extends State<LoggerDatePicker> {
  late DateTime currentPickedDate;
  late final TextEditingController _controller;
  late final DateFormat baseFormatter;
  late final DateFormat maskedFormatter;

  @override
  void initState() {
    super.initState();
    baseFormatter = DateFormat('yyyy-MM-dd');
    maskedFormatter = DateFormat(widget.dateMask, widget.languageCode);

    currentPickedDate = DateTime.parse(widget.controller.text);
    _controller = TextEditingController();
    _controller.text = maskedFormatter.format(currentPickedDate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDatePickerDialog() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentPickedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null) {
      currentPickedDate = pickedDate;
      var internalDate = baseFormatter.format(pickedDate);
      _controller.text = maskedFormatter.format(pickedDate);
      widget.controller.text = internalDate;
      widget.onChanged(internalDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: _showDatePickerDialog,
      decoration: InputDecoration(
        icon: const Icon(Icons.date_range),
        label: Text(widget.fieldTitle),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 66, 66, 66),
          ),
        ),
      ),
    );
  }
}
