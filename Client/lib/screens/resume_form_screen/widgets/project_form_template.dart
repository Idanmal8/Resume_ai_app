import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';
import 'package:resume_ai_app/widgets/text_fields/text_fields.dart';

class ProjectFormTemplate extends StatelessWidget {
  final int index;

  const ProjectFormTemplate({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);
    return Column(
      children: [
        TextFieldCustome(
          controller: viewModel.professionalProjectNameController[index],
          labelText: 'Project name',
        ),
        const SizedBox(height: 10),
        TextFieldCustome(
          controller: viewModel.professionalProjectDiscription[index],
          labelText: 'Project description',
        ),
        const SizedBox(height: 10),
        TextFieldCustome(
          controller: viewModel.professionalProjectLinkController[index],
          labelText: 'Project link',
        ),
      ],
    );
  }
}
