import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';

class SkillesScreen extends StatelessWidget {
  const SkillesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Technical skills', style: TextStyle(fontSize: 24)),
        const Text(
          'Let us know about your technical skills',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: viewModel.skillController,
          decoration: const InputDecoration(
            labelText: 'Technical skills',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black, // Border color
                width: 2.0, // Border thickness
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ), // Adjust padding inside the field
          ),
          onSubmitted: (value) {
            viewModel.addSkill();
          },
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: viewModel.skills
              .map((skill) => Chip(
                    label: Text(skill),
                    onDeleted: () {
                      viewModel.removeSkill(skill);
                    },
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
         const Text('Soft skills', style: TextStyle(fontSize: 24)),
        const Text(
          'Let us know about your soft skills',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: viewModel.softSkillController,
          decoration: const InputDecoration(
            labelText: 'Soft skills',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black, // Border color
                width: 2.0, // Border thickness
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ), // Adjust padding inside the field
          ),
          onSubmitted: (value) {
            viewModel.addSoftSkill();
          },
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: viewModel.softSkills
              .map((skill) => Chip(
                    label: Text(skill),
                    onDeleted: () {
                      viewModel.removeSoftSkill(skill);
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}