import 'package:flutter/material.dart';
import 'package:mobile/services/meeting_service.dart';

class MeetingsProvider with ChangeNotifier {
  final MeetingService meetingService;

  MeetingsProvider(this.meetingService);
}
