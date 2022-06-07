import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2010),
  lastDate: DateTime(2030),
);

Future<TimeOfDay?> pickTime(BuildContext context) => showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);