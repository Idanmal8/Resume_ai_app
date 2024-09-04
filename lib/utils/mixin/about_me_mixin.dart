import 'package:flutter/material.dart';

mixin AboutMeMixin {
  final TextEditingController aboutMeController = TextEditingController();

  void dispose() {
    aboutMeController.dispose();
  }

  void clear() {
    aboutMeController.clear();
  }
}