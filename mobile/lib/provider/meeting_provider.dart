import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/services/meeting_service.dart';

class MeetingsProvider with ChangeNotifier {
  final MeetingService _meetingService;
  List<Meeting> _allMeetings = [];

  MeetingsProvider(this._meetingService);

  List<Meeting> get allMeetings => _allMeetings;

  Future<void> loadAllMeetings() async {
    print("Attempting to load all meetings...");
    try {
      _allMeetings = await _meetingService.fetchAllMeetings();
      print("All meetings loaded: ${_allMeetings.length}");
      notifyListeners();
    } catch (e) {
      print("Error loading all meetings: $e");
      throw e;
    }
  }
}
