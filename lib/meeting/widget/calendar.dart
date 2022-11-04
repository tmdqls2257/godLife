import 'package:flutter/material.dart';
import 'package:god_life/shared/shared.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key? key}) : super(key: key);

  @override
  State<CustomTableCalendar> createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  final todaysDate = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('New Event'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTextField(
                      controller: titleController, hint: 'Enter Title'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(
                      controller: descpController, hint: 'Enter Description'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: CustomText(text: 'Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty &&
                        descpController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomText(
                            text: 'Please enter title & description',
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                      //Navigator.pop(context);
                      return;
                    } else {
                      setState(
                        () {
                          if (mySelectedEvents[selectedCalendarDate] != null) {
                            mySelectedEvents[selectedCalendarDate]?.add(
                                MyEvents(
                                    eventTitle: titleController.text,
                                    eventDescp: descpController.text));
                          } else {
                            mySelectedEvents[selectedCalendarDate!] = [
                              MyEvents(
                                eventTitle: titleController.text,
                                eventDescp: descpController.text,
                              )
                            ];
                          }
                        },
                      );

                      titleController.clear();
                      descpController.clear();

                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: CustomText(text: 'Add'),
                ),
              ],
            ));
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: customColor[ColorType.orange]!, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: customColor[ColorType.orange]!, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Custom Calendar'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: CustomText(text: 'Add Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(
                  color: customColor[ColorType.black]!,
                  width: 2.0,
                ),
              ),
              child: TableCalendar(
                focusedDay: _focusedCalendarDate,
                firstDay: _initialCalendarDate,
                lastDay: _lastCalendarDate,
                calendarFormat: CalendarFormat.month,
                weekendDays: const [DateTime.sunday, 6],
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekHeight: 40.0,
                rowHeight: 60.0,
                eventLoader: _listOfDayEvents,
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                      color: customColor[ColorType.grey], fontSize: 20.0),
                  decoration: BoxDecoration(
                    color: customColor[ColorType.orange],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  formatButtonTextStyle: TextStyle(
                      color: customColor[ColorType.orange], fontSize: 16.0),
                  formatButtonDecoration: BoxDecoration(
                    color: customColor[ColorType.grey],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: customColor[ColorType.grey],
                    size: 28,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: customColor[ColorType.grey],
                    size: 28,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: customColor[ColorType.orange]),
                ),
                calendarStyle: CalendarStyle(
                  weekendTextStyle:
                      TextStyle(color: customColor[ColorType.orange]),
                  todayDecoration: BoxDecoration(
                    color: customColor[ColorType.orange],
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: customColor[ColorType.black],
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: customColor[ColorType.orange],
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (currentSelectedDate) {
                  return (isSameDay(
                    selectedCalendarDate!,
                    currentSelectedDate,
                  ));
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(
                    selectedCalendarDate,
                    selectedDay,
                  )) {
                    setState(() {
                      selectedCalendarDate = selectedDay;
                      _focusedCalendarDate = focusedDay;
                    });
                  }
                },
              ),
            ),
            ..._listOfDayEvents(selectedCalendarDate!).map(
              (myEvents) => ListTile(
                leading: Icon(
                  Icons.done,
                  color: customColor[ColorType.orange],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Event Title:   ${myEvents.eventTitle}'),
                ),
                subtitle: Text('Description:   ${myEvents.eventDescp}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyEvents {
  final String eventTitle;
  final String eventDescp;

  MyEvents({required this.eventTitle, required this.eventDescp});

  @override
  String toString() => eventTitle;
}
