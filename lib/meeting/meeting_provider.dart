import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'meeting_model.dart';

class MeetingProvider extends ChangeNotifier {
  final DateTime todaysDate = DateTime.now();
  DateTime _focusedCalendarDate = DateTime.now();
  final DateTime _initialCalendarDate = DateTime.utc(DateTime.now().year - 1);
  final DateTime _lastCalendarDate = DateTime.utc(DateTime.now().year + 1);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List<MyEvents>> mySelectedEvents = {};
  // var mySelectedEvents = [];

  DateTime get getFocusedCalendarDate => _focusedCalendarDate;
  DateTime get getInitialCalendarDate => _initialCalendarDate;
  DateTime get getLastCalendarDate => _lastCalendarDate;
  CalendarFormat get getCalendarFormat => _calendarFormat;

  updateCalendarFormat(CalendarFormat format) {
    _calendarFormat = format;
    notifyListeners();
  }

  updateFocusDay(DateTime focusedDay) {
    _focusedCalendarDate = focusedDay;
    notifyListeners();
  }

  updateSelectedCalendarDate(DateTime selectedDay) {
    selectedCalendarDate = selectedDay;
    notifyListeners();
  }

  addEvent(MyEvents event) {
    if (mySelectedEvents[_focusedCalendarDate] == null) {
      mySelectedEvents[_focusedCalendarDate] = [];
    }
    mySelectedEvents[_focusedCalendarDate]!.add(event);
    notifyListeners();
  }

  List<MyEvents> listOfDayEvents() {
    return mySelectedEvents[_focusedCalendarDate] ?? [];
  }
}
