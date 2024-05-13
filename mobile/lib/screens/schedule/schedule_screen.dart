import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/screens/schedule/widgets/meeting_card.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDay = DateTime.now();



  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<Meeting> getMeetingsForSelectedDay() {
    return _meetings
        .where((meeting) => isSameDate(meeting.duedatetime, _selectedDay))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Meeting> dailyMeetings = getMeetingsForSelectedDay();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF07AB81)),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF07AB81)),
            onPressed: () {
              // Implement your action for adding new events
            },
          ),
        ],
        title: const Text('Schedule', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              calendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: const TextStyle(color: Colors.white),
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Colors.white),
                decoration: BoxDecoration(
                  color: Color(0xFF07AB81),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.black54),
                weekendTextStyle: TextStyle(color: Colors.black54),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: dailyMeetings.length,
                itemBuilder: (context, index) {
                  return MeetingCard(inputMeeting: dailyMeetings[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
