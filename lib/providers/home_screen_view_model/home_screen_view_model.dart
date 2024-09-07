import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/resume/resume_configuration.dart';
import 'package:resume_ai_app/screens/designated_role_screen/designated_role_screen.dart';
import 'package:resume_ai_app/screens/resume_form_screen/resume_form_screen.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final List<ResumeConfiguration> _resumes = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ResumeConfiguration> get resumes => _resumes;

  HomeScreenViewModel() {
    _init();
  }

  void _init() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  void goToExistingResume(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DesignatedRoleScreen()));
  }

  void goToNewResume(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResumeFormScreen(resumes: _resumes)));
  }
}
