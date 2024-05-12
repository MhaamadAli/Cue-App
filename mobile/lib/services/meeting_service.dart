import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/utilities/secure_storage.dart';

class MeetingService {
  final String baseUrl = 'http://localhost:3000';
  final SecureStorage secureStorage;

  MeetingService(this.secureStorage);

  Future<List<Meeting>> fetchMeetings() async {}
}
