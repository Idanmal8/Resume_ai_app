import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/resume/resume_configuration.dart';
import 'package:resume_ai_app/screens/resume_form_screen/resume_form_screen.dart';
import 'package:resume_ai_app/screens/saved_user_information_list_screen/saved_user_information_list_screen.dart';

enum ResumeKind { newResume, exsistingResume }

class DesignatedScreenViewModel extends ChangeNotifier {
  final TextEditingController _jobDescriptionController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final List<String> _defaultRoles = [
    'Software Engineer',
    'Data Scientist',
    'Product Manager',
    'UX Designer',
    'UI Designer',
    'QA Engineer',
    'DevOps Engineer',
    'Security Engineer',
    'Fullstack developer',
    'Support Engineer',
    'Account Manager',
    'Program Manager',
    'Recruiter',
    'Sales Engineer',
    'Trainer',
    'Architect',
    'Lead',
    'Director',
    'Consultant',
    'Evangelist',
    'Specialist',
    'Analyst',
  ];
  String _selectedRole = '';

  TextEditingController get jobDescriptionController => _jobDescriptionController;
  TextEditingController get roleController => _roleController;
  List<String> get defaultRoles => _defaultRoles;
  String get selectedRole => _selectedRole;

  void setRole(String role) {
    _roleController.clear();
    _selectedRole = role;
    notifyListeners();
  }

  void clearRoleSelection() {
    _selectedRole = '';
    notifyListeners();
  }

  void goToCreateNewScreen(BuildContext context, ResumeKind kind) {
    if (kind == ResumeKind.exsistingResume) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SavedUserInformationListScreen()));
      notifyListeners();
      return;
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResumeFormScreen()));
      notifyListeners();
    }
  }

  ResumeConfiguration createResumeKind(ResumeKind kind) {
    ResumeConfiguration resumeConfiguration = ResumeConfiguration(
        kind: kind, role: roleController.text.isNotEmpty ? roleController.text : _selectedRole, jobDescription: '');
    return resumeConfiguration;
  }
}
