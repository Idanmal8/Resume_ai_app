import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_ai_app/providers/designated_screen_view_model/designated_screen_view_model.dart';
import 'package:resume_ai_app/screens/designated_role_screen/widgets/chip_role.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';
import 'package:resume_ai_app/widgets/text_fields/text_fields.dart';

class DesignatedRoleScreen extends StatelessWidget {
  const DesignatedRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To what role are we heading?'),
      ),
      body: ChangeNotifierProvider<DesignatedScreenViewModel>(
        create: (context) => DesignatedScreenViewModel(),
        child: Consumer<DesignatedScreenViewModel>(
          builder: (context, viewModel, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: viewModel.roleController,
                          onChanged: (value) => viewModel.clearRoleSelection(),
                          decoration: const InputDecoration(
                            labelText: 'Write custome role',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(0)), // Square borders
                              borderSide: BorderSide(
                                color: Colors.grey, // Color of the border
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('or choose from the default roles',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            ...viewModel.defaultRoles.map(
                              (role) {
                                return ChipRole(
                                  role: role,
                                  isSelected: viewModel.selectedRole == role,
                                  onTap: (role) => viewModel.setRole(role),
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text('Add description (not required)',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: viewModel.jobDescriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Add the job requirements / description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(0)), // Square borders
                              borderSide: BorderSide(
                                color: Colors.grey, // Color of the border
                              ),
                            ),
                          ),
                          minLines: 5,
                          maxLines: 5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                  AppColors().mainColor),
                            ),
                            onPressed: () {
                              viewModel.goToCreateNewScreen(
                                  context, ResumeKind.exsistingResume);
                            },
                            child: const Text('Next',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
