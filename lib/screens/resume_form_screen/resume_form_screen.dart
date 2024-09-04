import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:resume_ai_app/providers/resume_form_screen_view_model/resume_form_screen_view_model.dart';

import 'package:resume_ai_app/screens/resume_form_screen/widgets/additional_information.dart';
import 'package:resume_ai_app/screens/resume_form_screen/widgets/personal_information.dart';
import 'package:resume_ai_app/screens/resume_form_screen/widgets/projects_form.dart';
import 'package:resume_ai_app/screens/resume_form_screen/widgets/skilles_screen.dart';

import 'package:resume_ai_app/utils/colors/app_colors.dart';

import 'package:resume_ai_app/widgets/errors/fix_chip.dart';

class ResumeFormScreen extends StatelessWidget {
  const ResumeFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a resume'),
      ),
      body: ChangeNotifierProvider<ResumeFormScreenViewModel>(
        create: (context) => ResumeFormScreenViewModel(),
        child: Consumer<ResumeFormScreenViewModel>(
          builder: (context, viewModel, _) {
            return Stack(children: [
              Center(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Stepper(
                          physics: const ScrollPhysics(),
                          connectorThickness: 0,
                          elevation: 0,
                          currentStep: viewModel.stepIndex,
                          onStepContinue: () {
                            if (viewModel.stepIndex == 3) {
                              viewModel.goToOutcomeScreen(context);
                            } else {
                              viewModel.validateStepBeforeMoving();
                            }
                          },
                          onStepCancel: () {
                            viewModel.previousStep();
                          },
                          controlsBuilder:
                              (BuildContext context, ControlsDetails details) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors().mainColor, // Blue color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Default rectangle
                                      ),
                                    ),
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                if (viewModel.stepIndex > 0)
                                  const SizedBox(width: 8),
                                if (viewModel.stepIndex > 0)
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: details.onStepCancel,
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              4.0), // Default rectangle
                                        ),
                                      ),
                                      child: const Text(
                                        'Back',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                          type: StepperType.horizontal,
                          steps: [
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text(' Personal ',
                                  style: TextStyle(fontSize: 12)),
                              content: PersonalInformation(
                                fullNameController:
                                    viewModel.fullNameController,
                                phoneNumberController:
                                    viewModel.phoneNumberController,
                                emailController: viewModel.emailController,
                                linkedInController:
                                    viewModel.linkedInController,
                                githubController: viewModel.githubController,
                                portfolioController:
                                    viewModel.portfolioController,
                                instagramController:
                                    viewModel.instagramController,
                                locationController:
                                    viewModel.locationController,
                                professionController:
                                    viewModel.professionController,
                              ),
                              stepStyle: StepStyle(
                                color: viewModel.stepIndex >= 0
                                    ? AppColors().mainColor
                                    : Colors.grey,
                              ),
                            ),
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text('Additional',
                                  style: TextStyle(fontSize: 12)),
                              content: const AdditionalInformation(),
                              stepStyle: StepStyle(
                                color: viewModel.stepIndex >= 1
                                    ? AppColors().mainColor
                                    : Colors.grey,
                              ),
                            ),
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text('  Skills  ',
                                  style: TextStyle(fontSize: 12)),
                              content: const SkillesScreen(),
                              stepStyle: StepStyle(
                                color: viewModel.stepIndex >= 2
                                    ? AppColors().mainColor
                                    : Colors.grey,
                              ),
                            ),
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text(' Projects ',
                                  style: TextStyle(fontSize: 12)),
                              content: const ProjectsForm(),
                              stepStyle: StepStyle(
                                color: viewModel.stepIndex >= 3
                                    ? AppColors().mainColor
                                    : Colors.grey,
                              ),
                            ),
                            // Add more steps here if necessary
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (viewModel.errorMessage.isNotEmpty)
                FixChip(error: viewModel.errorMessage),
            ]);
          },
        ),
      ),
    );
  }
}
