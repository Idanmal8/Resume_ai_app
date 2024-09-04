import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';
import 'package:resume_ai_app/screens/resume_form_screen/widgets/project_form_template.dart';

class ProjectsForm extends StatelessWidget {
  const ProjectsForm({super.key});

  @override
  Widget build(BuildContext context) {
    // add the viewmodel
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Professional projects', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        ...viewModel.userProfessionalProjects.map(
          (project) {
            final index = viewModel.userProfessionalProjects.indexOf(project);
            return Column(
              children: [
                ProjectFormTemplate(index: index),
                const SizedBox(height: 10),
                //add remove button
                IconButton(
                onPressed: () {
                  viewModel.removeProProject(index);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
              ],
            );
          },
        ),

        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                viewModel.addProProject();
              },
              icon: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
