import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_ai_app/auth/auth.dart';
import 'package:resume_ai_app/screens/home_screen/home_screen.dart';
import 'package:resume_ai_app/utils/mixin/sign_in_mixin.dart';

class LogInScreenViewModel extends ChangeNotifier with SignInMixin {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signIn(BuildContext context) async {
    if (isEmailValid(emailController.text) &&
        isPasswordValid(passwordController.text)) {
      _isLoading = true;
      notifyListeners();

      try {
        Auth auth = Auth();
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (context.mounted) {
          _isLoading = false;
          goToHomeScreen(context);
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Authentication Error')),
          );
        }
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
