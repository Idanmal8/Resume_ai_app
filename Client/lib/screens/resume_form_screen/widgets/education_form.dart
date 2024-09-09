import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/models/enum/degree.dart';
import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';

class EducationForm extends StatelessWidget {
  final int index;

  const EducationForm({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: viewModel.schoolNameControllers[index],
                onChanged: (String value) {
                  viewModel.updateEducation(index);
                },
                decoration: const InputDecoration(
                  labelText: 'School Name*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            DropdownButton<Degree>(
              value: Degree.fromString(viewModel.education[index].degree),
              items: Degree.values.map((Degree degree) {
                return DropdownMenuItem<Degree>(
                  value: degree,
                  child: Text(degree.toString().split('.').last),
                );
              }).toList(),
              onChanged: (Degree? newValue) {
                if (newValue != null) {
                  viewModel.updateDegree(index, newValue);
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: viewModel.fieldOfStudyControllers[index],
          onChanged: (String value) {
            viewModel.updateEducation(index);
          },
          decoration: const InputDecoration(
            labelText: 'Field of study*',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: viewModel.startDateEducationControllers[index],
                onChanged: (String value) {
                  viewModel.updateEducation(index);
                },
                decoration: const InputDecoration(
                  labelText: 'Start Date*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: viewModel.endDateEducationControllers[index],
                onChanged: (String value) {
                  viewModel.updateEducation(index);
                },
                decoration: const InputDecoration(
                  labelText: 'End Date*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
