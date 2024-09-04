import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/providers/output_screen/output_screen_view_model.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/brown_rose_template.dart';

class OutputScreen extends StatelessWidget {
  // final UserInformation userInformation;
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<OutputScreenViewModel>(
        create: (context) => OutputScreenViewModel(),
        child: Consumer<OutputScreenViewModel>(
          builder: (context, viewModel, _) {
            return viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                :
            ResumeTemplateBrownRose(userInformation: viewModel.geminiOutcome);
          },
        ),
      ),
    );
  }
}
