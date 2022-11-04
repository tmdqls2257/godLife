import 'package:flutter/material.dart';

import 'widget/calendar.dart';

class Meeting extends StatefulWidget {
  const Meeting({super.key});

  @override
  State<Meeting> createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  @override
  Widget build(BuildContext context) {
    return const CustomTableCalendar();
  }
}
