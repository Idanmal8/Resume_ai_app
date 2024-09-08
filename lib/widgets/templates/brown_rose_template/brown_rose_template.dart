import 'package:flutter/material.dart';

import 'package:resume_ai_app/models/user_information.dart';

import 'package:resume_ai_app/utils/colors/app_colors.dart';

import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/user_contact_information_widget.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/languages_list_brown_widget.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/user_projects_box_widget.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/user_education_widget.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/user_fun_projects_box.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/work_expirience_box.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/user_skills_widget.dart';
import 'package:resume_ai_app/widgets/templates/brown_rose_template/widgets/refrences_box.dart';

class ResumeTemplateBrownRose extends StatelessWidget {
  final UserInformation userInformation;

  const ResumeTemplateBrownRose({
    required this.userInformation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
              fontFamily: 'Poppins', // Replace with your font
              color: Colors.black
            ),
          child: Container(
            alignment: Alignment.center,
            height:600,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: ResumeBrownRoseColors().brownRose,
                      ),
                    ),
                    Expanded(
                      flex: 12,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(height: 16),
                                // Image.asset(
                                //   'assets/mock/wedding.jpg',
                                //   width: 120,
                                // ),
                                UserContactBrownRoseWidget(
                                    phoneNumber: userInformation.phoneNumber,
                                    email: userInformation.email,
                                    portfolio: userInformation
                                            .userScocialMedia.github ??
                                        '',
                                    location: 'Jerusalem, Israel'),
                                UserEducationWidget(
                                    userEducation:
                                        userInformation.userEducation),
                                UserSkillsBrownWidget(
                                    userSoftSkills:
                                        userInformation.softSkills,
                                    userTechnicalSkills:
                                        userInformation.technicalSkills),
                                LanguagesListBrownWidget(
                                    languages: userInformation.languages),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 45),
                          Text(userInformation.fullName,
                              style: const TextStyle(fontSize: 32)),
                          const Text('Software Engineer',
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Icon(Icons.person_outline_rounded, size: 16),
                              SizedBox(width: 4),
                              Text('Profile')
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(userInformation.aboutMe,
                              style: const TextStyle(fontSize: 8)),
                          const SizedBox(height: 32),
                          const Row(
                            children: [
                              Icon(Icons.work_outline_rounded, size: 16),
                              SizedBox(width: 4),
                              Text('Work Experience')
                            ],
                          ),
                          const SizedBox(height: 8),
                          ...userInformation.userExpirience.map((work) {
                            return WorkExpirienceBox(
                              userExpirience: work,
                            );
                          }),
                          const SizedBox(height: 32),
                          const Row(
                            children: [
                              Icon(Icons.tab, size: 16),
                              SizedBox(width: 4),
                              Text('Projects')
                            ],
                          ),
                          const SizedBox(height: 8),
                          ...userInformation.userProfessionalProjects.map(
                            (project) {
                              return UserProjectsBoxWidget(
                                  userProjects: project);
                            },
                          ),
        
                          // const SizedBox(height: 32),
                          // const Row(
                          //   children: [
                          //     Icon(Icons.collections_bookmark, size: 16),
                          //     SizedBox(width: 4),
                          //     Text('Fun Projects')
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // ...userInformation.userFunProjects.map(
                          //   (project) {
                          //     return UserFunProjectsBox(
                          //         userFunProjects: project);
                          //   },
                          // ),
                          // const SizedBox(height: 32),
                          // const Row(
                          //   children: [
                          //     Icon(Icons.menu_book_rounded, size: 16),
                          //     SizedBox(width: 4),
                          //     Text('References')
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // const RefrencesBox(refrence: 'refrence', phone: 'phone', email: 'email', role: 'role')
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
