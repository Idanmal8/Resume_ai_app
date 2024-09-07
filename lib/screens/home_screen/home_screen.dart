import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/providers/home_screen_view_model/home_screen_view_model.dart';
import 'package:resume_ai_app/screens/designated_role_screen/designated_role_screen.dart';
import 'package:resume_ai_app/screens/resume_form_screen/resume_form_screen.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';
import 'package:resume_ai_app/widgets/resume_container.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/brown_rose_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My resumes'),
      ),
      body: ChangeNotifierProvider<HomeScreenViewModel>(
        create: (context) => HomeScreenViewModel(),
        child: Consumer<HomeScreenViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(children: [
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: [
                  ...viewModel.resumes.map((resume) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: resume.userInformation != null
                          ? ResumeTemplateBrownRose(
                              userInformation: resume.userInformation!)
                          : const SizedBox.shrink(),
                    );
                  }),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ResumeContainer(
                      resumeImage: '',
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        heroTag: 'add_resume_button_2',
                        elevation: 0,
                        backgroundColor: AppColors().mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          viewModel.goToNewResume(context);
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FloatingActionButton(
                        tooltip: 'Create resume with saved configuration',
                        heroTag: 'add_resume_button',
                        elevation: 0,
                        backgroundColor: AppColors().mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          viewModel.goToExistingResume(context);
                        },
                        child: const Icon(Icons.edit_square),
                      ),
                    ],
                  ),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
