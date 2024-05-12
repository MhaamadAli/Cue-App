import 'package:intl/intl.dart';

class Meeting {
  final int id;
  final String title;
  final String description;
  final DateTime duedatetime;

  Meeting(
      {required this.id,
      required this.title,
      required this.description,
      required this.duedatetime});

  String getFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(duedatetime);
  }

  String getFormattedTime() {
    return DateFormat('HH:mm').format(duedatetime);
  }

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duedatetime: json['date']);
  }
}
