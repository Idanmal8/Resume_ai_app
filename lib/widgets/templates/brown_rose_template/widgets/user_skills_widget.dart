import 'package:flutter/material.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class UserSkillsBrownWidget extends StatelessWidget {
  final List<String> userSoftSkills;
  final List<String> userTechnicalSkills;

  const UserSkillsBrownWidget({
    required this.userSoftSkills,
    required this.userTechnicalSkills,
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
                    'Skills',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text('Soft Skills', style: TextStyle(fontSize: 6)),
        const SizedBox(height: 2),
        ...userSoftSkills.map((skill) {
          return Wrap(
            alignment: WrapAlignment.start,
            children: [
              Text(
                skill,
                style: const TextStyle(fontSize: 4),
              ),
              const SizedBox(height: 2),
            ],
          );
        }),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Technical Skills', style: TextStyle(fontSize: 6)),
            const SizedBox(height: 2),
            ...userTechnicalSkills.map((skill) {
              return Wrap(
                children: [
                  Text(
                    skill,
                    style: const TextStyle(fontSize: 4),
                  ),
                  const SizedBox(height: 2),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
