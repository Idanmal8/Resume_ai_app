import 'package:flutter/material.dart';

class TextFieldCustome extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const TextFieldCustome({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This is required';
        }
        return null;
      },
    );
  }
}
