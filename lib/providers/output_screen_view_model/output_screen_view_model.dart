import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/service/gemini_service.dart';

class OutputScreenViewModel extends ChangeNotifier {
  bool _isLoading = false;
  late UserInformation _geminiOutcome;

  bool get isLoading => _isLoading;
  UserInformation get geminiOutcome => _geminiOutcome;

  OutputScreenViewModel() {
    _init();
  }

  void _init() async {
    getGeminiOutcome();
  }

  void getGeminiOutcome() async {
    _isLoading = true;
    notifyListeners();

    final response = await GeminiService().generateContent();
    _geminiOutcome = response;

    _isLoading = false;
    notifyListeners();
    return;
  }
}
