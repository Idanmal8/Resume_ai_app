import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_education.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class UserEducationWidget extends StatelessWidget {
  final List<UserEducation> userEducation;

  const UserEducationWidget({
    required this.userEducation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ResumeBrownRoseColors().brownRose,
          child: const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 2, right: 16),
                  child: Text(
                    'Education',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...userEducation.map((education) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                education.schoolName,
                style: const TextStyle(fontSize: 6),
              ),
              const SizedBox(height: 2),
              Text(
                '${education.degree} at ${education.field}',
                style: const TextStyle(fontSize: 4),
              ),
              const SizedBox(height: 2),
              Text(
                '${education.startDate} - ${education.endDate}',
                style: const TextStyle(fontSize: 4),
              ),
              const SizedBox(height: 8),
            ],
          );
        })
      ],
    );
  }
}
