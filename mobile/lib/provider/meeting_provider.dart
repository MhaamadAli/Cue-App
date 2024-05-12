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
    notifyListeners();
  }
}
