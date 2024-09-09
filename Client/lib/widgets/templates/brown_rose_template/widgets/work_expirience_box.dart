import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_expirience.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class WorkExpirienceBox extends StatelessWidget {
  final UserExpirience userExpirience;

  const WorkExpirienceBox({
    required this.userExpirience,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(userExpirience.startDate, style: const TextStyle(fontSize: 8)),
                  const Text('-'),
                  Text(userExpirience.endDate, style: const TextStyle(fontSize: 8)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ResumeBrownRoseColors().brownRose,
                  width: 1
                ),            
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userExpirience.companyName, style: const TextStyle(fontSize: 8)),
                  const SizedBox(height: 2),
                  Text(userExpirience.position, style: const TextStyle(fontSize: 6)),
                  const SizedBox(height: 2),
                  Text(userExpirience.description, style: const TextStyle(fontSize: 4)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
