import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_professional_projects.dart';

class UserProjectsBoxWidget extends StatelessWidget {
  final UserProfessionalProjects userProjects;

  const UserProjectsBoxWidget({
    required this.userProjects,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userProjects.projectName, style: const TextStyle(fontSize: 8)),
            const SizedBox(height: 2),
            Text(userProjects.projectDescription, style: const TextStyle(fontSize: 6)),
            const SizedBox(height: 2),
            userProjects.projectLink != null ?  Row(
              children: [
                const Icon(Icons.link, size: 8),
                const SizedBox(width: 4),
                Text(userProjects.projectLink ?? '', style: const TextStyle(fontSize: 4)),
              ],
            ) : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
