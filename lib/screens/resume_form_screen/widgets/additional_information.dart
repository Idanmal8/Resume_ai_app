import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';
import 'package:resume_ai_app/screens/resume_form_screen/widgets/expirience_form.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Additional Information', style: TextStyle(fontSize: 24)),
        const Text(
            'Share more about yourself to make your resume\nstand out so the AI do its magic.',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        TextFormField(
          controller: viewModel.aboutMeController,
          keyboardType: TextInputType.text,
          minLines: 7,
          maxLines: 7,
          decoration: const InputDecoration(
            label: Text('About me / Profile'),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Experience', style: TextStyle(fontSize: 24)),
        ...List.generate(viewModel.experiences.length, (index) {
          return Column(
            children: [
              ExperienceForm(
                companyNameController: viewModel.companyNameControllers[index],
                positionController: viewModel.positionControllers[index],
                startDateController: viewModel.startDateControllers[index],
                endDateController: viewModel.endDateControllers[index],
                descriptionController: viewModel.descriptionControllers[index],
                onChanged: (String value) {
                  viewModel.updateExperience(index);
                },
              ),
              IconButton(
                onPressed: () {
                  viewModel.removeExperience(index);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          );
        }),
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
                viewModel.addExperience();
              },
              
              icon: const Icon(Icons.add)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
