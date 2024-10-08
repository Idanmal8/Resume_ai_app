import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resume_ai_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}
