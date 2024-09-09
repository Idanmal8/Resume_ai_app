import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';

import 'package:resume_ai_app/screens/resume_form_screen/widgets/education_form.dart';

import 'package:resume_ai_app/widgets/text_fields/text_fields_with_icon.dart';
import 'package:resume_ai_app/widgets/text_fields/text_fields.dart';

class PersonalInformation extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController linkedInController;
  final TextEditingController githubController;
  final TextEditingController portfolioController;
  final TextEditingController instagramController;
  final TextEditingController locationController;
  final TextEditingController professionController;

  const PersonalInformation({
    required this.fullNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.linkedInController,
    required this.githubController,
    required this.portfolioController,
    required this.instagramController,
    required this.locationController,
    required this.professionController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResumeFormScreenViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Personal Information', style: TextStyle(fontSize: 24)),
        const Text(
          'Let us get to know you a bit better by \nsharing your basic info',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        const Text('* Required fields', style: TextStyle(color: Colors.red)),
        const SizedBox(height: 10),
        TextFieldCustome(
            controller: fullNameController, labelText: 'Full Name*'),
        const SizedBox(height: 20),
        TextFieldCustome(
            controller: professionController, labelText: 'Profession*'),
        const SizedBox(height: 20),
        TextFieldCustome(
            controller: phoneNumberController, labelText: 'Phone Number*'),
        const SizedBox(height: 20),
        TextFieldCustome(controller: emailController, labelText: 'Email*'),
        const SizedBox(height: 20),
        TextFieldCustome(
            controller: locationController, labelText: 'Location*'),
        const SizedBox(height: 20),
        const Text('Education', style: TextStyle(fontSize: 24)),
        const Text(
          'Tell us about your education background',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ...List.generate(viewModel.education.length, (index) {
          return Column(
            children: [
              EducationForm(
                index: index,
              ),
              IconButton(
                onPressed: () {
                  viewModel.removeEducation(index);
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
                viewModel.addEducation();
              },
              icon: const Icon(Icons.add)),
        ),
        const SizedBox(height: 20),
        const Text('Social׳s', style: TextStyle(fontSize: 24)),
        const Text(
          'Share your social media links with us',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        TextFieldCustomeWithPrefixIcon(
            controller: linkedInController,
            labelText: 'Linkedin',
            iconPath: 'assets/social_icons/linkedin.png'),
        const SizedBox(height: 10),
        TextFieldCustomeWithPrefixIcon(
            controller: portfolioController,
            labelText: 'Portfolio',
            iconPath: 'assets/social_icons/web.png'),
        const SizedBox(height: 10),
        TextFieldCustomeWithPrefixIcon(
            controller: instagramController,
            labelText: 'Instagram',
            iconPath: 'assets/social_icons/instagram.png'),
        const SizedBox(height: 10),
        TextFieldCustomeWithPrefixIcon(
            controller: githubController,
            labelText: 'Github',
            iconPath: 'assets/social_icons/github.png'),
        const SizedBox(height: 10),
      ],
    );
  }
}
