import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/services/meeting_service.dart';

class MeetingsProvider with ChangeNotifier {
  final MeetingService meetingService;
  List<Meeting> _meetings = [];

  MeetingsProvider(this.meetingService);

  List<Meeting> get meetings => _meetings;

  Future<void> loadMeetings() async {
    _meetings = await meetingService.fetchMeetings();
    _meetings.sort((a, b) => a.duedatetime.compareTo(b.duedatetime));
    _meetings = _meetings.where((meeting) {
      return meeting.duedatetime.isAfter(DateTime.now());
    }).toList();
    if (_meetings.length > 3) {
      _meetings = _meetings.sublist(0, 3);
    }
    notifyListeners();
  }
}
