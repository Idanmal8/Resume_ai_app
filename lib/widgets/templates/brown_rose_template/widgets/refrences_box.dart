import 'package:flutter/material.dart';

class RefrencesBox extends StatelessWidget {
  final String refrence;
  final String phone;
  final String email;
  final String role;

  const RefrencesBox(
      {super.key,
      required this.refrence,
      required this.phone,
      required this.email,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(refrence, style: const TextStyle(fontSize: 8)),
        const SizedBox(height: 2),
        Text(role, style: const TextStyle(fontSize: 6)),
        const SizedBox(height: 2),
        Row(
          children: [
            const Text('Phone:', style: TextStyle(fontSize: 4)),
            const SizedBox(width: 4),
            Text(phone, style: const TextStyle(fontSize: 4)),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Text('Email:', style: TextStyle(fontSize: 4)),
            const SizedBox(width: 4),
            Text(email, style: const TextStyle(fontSize: 4)),
          ],
        ),
      ],
    );
  }
}
