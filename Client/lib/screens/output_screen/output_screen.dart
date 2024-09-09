import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/mock/user_information_mock.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/providers/output_screen_view_model/output_screen_view_model.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/brown_rose_template.dart';

class OutputScreen extends StatelessWidget {
  // final UserInformation userInformation;
  const OutputScreen({
    super.key,
    // required this.userInformation,
  });

  @override
  Widget build(BuildContext context) {
    final UserInformation userInformation = createMockUserInformation();
    final ExportDelegate exportDelegate = ExportDelegate();

    return Scaffold(
      body: ChangeNotifierProvider<OutputScreenViewModel>(
        create: (context) => OutputScreenViewModel(userInformation),
        child: Consumer<OutputScreenViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Transform.scale(
                    scale: 0.80,
                    child: ExportFrame(
                      frameId: 'brown_rose_template',
                      exportDelegate: exportDelegate,
                      child: ResumeTemplateBrownRose(
                          userInformation: viewModel.geminiOutcome),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          {
                            final ExportOptions overrideOptions = ExportOptions(
                              pageFormatOptions: PageFormatOptions.custom(
                                  width: 1920, height: 1080),
                              textFieldOptions: TextFieldOptions.uniform(
                                interactive: true,
                              ),
                              checkboxOptions: CheckboxOptions.uniform(
                                interactive: false,
                              ),
                            );
                            final pdf =
                                await exportDelegate.exportToPdfDocument(
                              'brown_rose_template',
                              overrideOptions: overrideOptions
                            );
                            viewModel.saveFile(pdf, 'static-example');
                          }
                        },
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              width: 50,
                              height: 50,
                              'assets/resume_actions/download.png',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              width: 50,
                              height: 50,
                              'assets/resume_actions/inspection.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
