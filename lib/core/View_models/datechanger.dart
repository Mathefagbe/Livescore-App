import 'package:flutter/cupertino.dart';

class DateChangerview extends ChangeNotifier {
  DateTime? currentDay;
  DateTime focusdays = DateTime.now();

  void dateChanger(DateTime selectedDay, DateTime focusDay) {
    currentDay = selectedDay;
    focusdays = focusDay;
    notifyListeners();
  }
}
