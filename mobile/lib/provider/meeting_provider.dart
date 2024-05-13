import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/services/meeting_service.dart';

class MeetingsProvider with ChangeNotifier {
  final MeetingService _meetingService;
  List<Meeting> _allMeetings = [];
  List<Meeting> _closestMeetings = [];

  MeetingsProvider(this._meetingService);

  List<Meeting> get allMeetings => _allMeetings;
  List<Meeting> get closestMeetings => _closestMeetings;

  Future<void> loadAllMeetings() async {
    print("Attempting to load all meetings...");
    try {
      _allMeetings = await _meetingService.fetchAllMeetings();
      print("All meetings loaded: ${_allMeetings.length}");
      _updateClosestMeetings();
      notifyListeners();
    } catch (e) {
      print("Error loading all meetings: $e");
      throw e;
    }
  }

  void _updateClosestMeetings() {
    print("Updating nearest meetings...");
    _closestMeetings = _allMeetings
        .where((meeting) => meeting.duedatetime.isAfter(DateTime.now()))
        .toList();
    _closestMeetings.sort((a, b) => a.duedatetime.compareTo(b.duedatetime));
    if (_closestMeetings.length > 3) {
      _closestMeetings = _closestMeetings.sublist(0, 3);
    }
    print("Nearest meetings updated: ${_closestMeetings.length}");
  }
}
