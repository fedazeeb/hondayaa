import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  DateTime _dateTimeFrom = DateTime(DateTime.now().year,
      DateTime.now().month - 1, DateTime.now().day, DateTime.now().hour,DateTime.now().minute);
  DateTime _dateTimeTo = DateTime.now();

  DateTime get getdateTimeFrom {
    return _dateTimeFrom;
  }

  DateTime get getdateTimeTo {
    return _dateTimeTo;
  }

  changeDateTimeFrom(DateTime dateTime) {
    _dateTimeFrom = dateTime;
    notifyListeners();
  }

  changeDateTimeTo(DateTime dateTime) {
    _dateTimeTo = dateTime;
    notifyListeners();
  }
}
