import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_education.dart';

mixin EducationInformationMixin{
  List<UserEducation> education = [];
  List<TextEditingController> schoolNameControllers = [];
  List<TextEditingController> degreeControllers = [];
  List<TextEditingController> fieldOfStudyControllers = [];
  List<TextEditingController> startDateEducationControllers = [];
  List<TextEditingController> endDateEducationControllers = [];
}