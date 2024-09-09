import 'package:flutter/material.dart';

class TextFieldCustomeWithPrefixIcon extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String iconPath;

  const TextFieldCustomeWithPrefixIcon({
    super.key,
    required this.controller,
    required this.labelText,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Image.asset(iconPath,
            width: 25, height: 25),
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.black, // Border color
            width: 2.0, // Border thickness
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 8), // Adjust padding inside the field
      ),
    );
  }
}
