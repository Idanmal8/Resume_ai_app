import 'package:flutter/material.dart';

mixin PersonalInformationMixin {


  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  final TextEditingController linkedInController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();


  void clearAllFields() {
    fullNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    locationController.clear();
    professionController.clear();
    linkedInController.clear();
    githubController.clear();
    twitterController.clear();
    portfolioController.clear();
    instagramController.clear();
  }

  void disposeControllers() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    professionController.dispose();
    locationController.dispose();
    linkedInController.dispose();
    githubController.dispose();
    twitterController.dispose();
    portfolioController.dispose();
    instagramController.dispose();
  }

  // Method to validate email
  String? validateEmail() {
    final email = emailController.text;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Method to validate phone number
  String? validatePhoneNumber() {
    final phone = phoneNumberController.text;
    final phoneRegex = RegExp(r'^\+?[0-9]{7,14}$');
    if (phone.isEmpty || !phoneRegex.hasMatch(phone)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Method to validate full name
  String? validateFullName() {
    if (fullNameController.text.isEmpty) {
      return 'Full name cannot be empty';
    }
    return null;
  }
}
