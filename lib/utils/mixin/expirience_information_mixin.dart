import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_expirience.dart';

mixin ExpirienceInformationMixin {
  List<UserExpirience> experiences = [];
  List<TextEditingController> companyNameControllers = [];
  List<TextEditingController> positionControllers = [];
  List<TextEditingController> startDateControllers = [];
  List<TextEditingController> endDateControllers = [];
  List<TextEditingController> descriptionControllers = [];
}
