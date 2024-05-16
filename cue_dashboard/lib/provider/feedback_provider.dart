import 'package:cue_dashboard/models/feedback_model.dart';
import 'package:cue_dashboard/services/feedback_service.dart';
import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  List<FeedbackModel> _feedbacks = [];
  final FeedbackService _feedbackService = FeedbackService();

  List<FeedbackModel> get feedbacks => _feedbacks;

  
}
