import 'package:cue_dashboard/models/feedback_model.dart';
import 'package:cue_dashboard/services/feedback_service.dart';
import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  List<FeedbackModel> _feedbacks = [];
  final FeedbackService _feedbackService = FeedbackService();

  List<FeedbackModel> get feedbacks => _feedbacks;

  Future<void> fetchFeedbacks() async {
    try {
      _feedbacks = await _feedbackService.fetchFeedbacks();
      notifyListeners();
    } catch (e) {
      print('Error fetching feedbacks: $e');
      throw Exception('Failed to fetch feedbacks: $e');
    }
  }
}
