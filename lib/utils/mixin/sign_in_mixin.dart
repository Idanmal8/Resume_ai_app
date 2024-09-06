import 'package:flutter/material.dart';

mixin SignInMixin {
  //make a key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }
}
