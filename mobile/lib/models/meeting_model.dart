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

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json['id']
          as int,
      title: json['title'] as String? ?? 'No title',
      description: json['description'] as String? ??
          'No description',
      duedatetime: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
    );
  }

  String getFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(duedatetime);
  }

  String getFormattedTime() {
    return DateFormat('HH:mm').format(duedatetime);
  }
}
