import 'package:flutter/material.dart';
import 'package:god_life/meeting/meeting_provider.dart';
import 'package:god_life/meeting/widget/calendar.dart';
import 'package:god_life/shared/shared.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Meeting extends StatefulWidget {
  const Meeting({super.key});

  @override
  State<Meeting> createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  _showAddEventDialog(
      MeetingProvider meetingProvider, DateTime focusedCalendarDate) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(controller: titleController, hint: 'hint'),
            CustomTextField(controller: descpController, hint: 'hint'),
          ],
        ),
        actions: [
          Row(
            children: [
              CustomButton(
                width: CustomW.w1,
                label: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 16,
              ),
              CustomButton(
                width: CustomW.w1,
                label: 'Add',
                onPressed: () {
                  meetingProvider.addEvent(
                    MyEvents(
                      eventTitle: titleController.text,
                      eventDescp: descpController.text,
                    ),
                  );
                  titleController.text = '';
                  descpController.text = '';
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MeetingProvider meetingProvider = Provider.of<MeetingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // title: CustomText(text: 'Custom Calendar'),
        backgroundColor: customColor[ColorType.orange],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TableCalendar(
            firstDay: meetingProvider.getInitialCalendarDate,
            focusedDay: meetingProvider.getFocusedCalendarDate,
            lastDay: meetingProvider.getLastCalendarDate,
            calendarFormat: meetingProvider.getCalendarFormat,
            onFormatChanged: (format) =>
                meetingProvider.updateCalendarFormat(format),
            selectedDayPredicate: (currentSelectedDate) {
              return (isSameDay(
                meetingProvider.getFocusedCalendarDate,
                currentSelectedDate,
              ));
            },
            onDaySelected: (selectedDay, focusedDay) =>
                meetingProvider.updateFocusDay(focusedDay),
          ),
          Column(
            children: meetingProvider
                .listOfDayEvents()
                .map((e) => Text(e.eventTitle))
                .toList(),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(
            meetingProvider, meetingProvider.getFocusedCalendarDate),
        child: const Icon(Icons.add),
      ),
    );
  }
}
