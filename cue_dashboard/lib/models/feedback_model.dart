import 'package:intl/intl.dart';

class FeedbackModel {
  final int id;
  final String userName;
  final String feedback;
  final DateTime date;

  FeedbackModel({
    required this.id,
    required this.userName,
    required this.feedback,
    required this.date,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'] as int,
      date: DateTime.parse(json['timestamp']),
      userName: json['user']['username'],
      feedback: json['message'] as String,
    );
  }

  String get formattedDate => DateFormat.yMMMd().add_jm().format(date);
}
