import 'package:flutter/material.dart';
import 'package:resume_ai_app/mock/user_information_mock.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/screens/home_screen/home_screen.dart';
import 'package:resume_ai_app/screens/log_in_screen/log_in_screen.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final UserInformation userInformation = createMockUserInformation();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: const LogInScreen(),
    );
  }
}
