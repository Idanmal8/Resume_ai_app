import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_fun_projects.dart';

class UserFunProjectsBox extends StatelessWidget {
  final UserFunProjects userFunProjects;

  const UserFunProjectsBox({
    required this.userFunProjects,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userFunProjects.projectName, style: const TextStyle(fontSize: 8)),
            const SizedBox(height: 2),
            Text(userFunProjects.projectDescription,
                style: const TextStyle(fontSize: 6)),
            const SizedBox(height: 2),
            userFunProjects.projectLink != null
                ? Row(
                    children: [
                      const Icon(Icons.link, size: 8),
                      const SizedBox(width: 4),
                      Text(userFunProjects.projectLink ?? '',
                          style: const TextStyle(fontSize: 4)),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
