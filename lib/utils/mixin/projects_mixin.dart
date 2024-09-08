import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/user_fun_projects.dart';
import 'package:resume_ai_app/models/user_professional_projects.dart';

mixin ProjectsMixin {
  List<UserProfessionalProjects> userProfessionalProjects = [];
  List<TextEditingController> professionalProjectNameController = [];
  List<TextEditingController> professionalProjectDiscription = [];
  List<TextEditingController> professionalProjectLinkController = [];

  List<UserFunProjects> userFunProjects = [];
  List<TextEditingController> funProjectNameController = [];
  List<TextEditingController> funProjectDiscription = [];
  List<TextEditingController> funProjectLinkController = [];

  void clearAllFields() {
    professionalProjectNameController.clear();
    professionalProjectDiscription.clear();
    professionalProjectLinkController.clear();
    funProjectNameController.clear();
    funProjectDiscription.clear();
    funProjectLinkController.clear();
  }

  void disposeControllers() {
    for (var element in professionalProjectNameController) {
      element.dispose();
    }
    for (var element in professionalProjectDiscription) {
      element.dispose();
    }
    for (var element in professionalProjectLinkController) {
      element.dispose();
    }
    for (var element in funProjectNameController) {
      element.dispose();
    }
    for (var element in funProjectDiscription) {
      element.dispose();
    }
    for (var element in funProjectLinkController) {
      element.dispose();
    }
  }

  // Professional projects
  void addProfessionalProject() {
    userProfessionalProjects.add(UserProfessionalProjects(
        projectName: '', projectDescription: '', projectLink: ''));

    professionalProjectNameController.add(TextEditingController());
    professionalProjectDiscription.add(TextEditingController());
    professionalProjectLinkController.add(TextEditingController());
  }

  void updateProfessionalProject(int index) {
    userProfessionalProjects[index] = userProfessionalProjects[index].copyWith(
      projectName: professionalProjectNameController[index].text,
      projectDescription: professionalProjectDiscription[index].text,
      projectLink: professionalProjectLinkController[index].text,
    );

    print(professionalProjectNameController[index]
        .text); // Check if the text controller is updating correctly
    print(userProfessionalProjects[index]
        .projectName); // Check the updated value in the object
  }

  void removeProfessionalProject(int index) {
    userProfessionalProjects.removeAt(index);
    professionalProjectNameController[index].dispose();
    professionalProjectDiscription[index].dispose();
    professionalProjectLinkController[index].dispose();

    professionalProjectNameController.removeAt(index);
    professionalProjectDiscription.removeAt(index);
    professionalProjectLinkController.removeAt(index);
  }

  // Fun projects
  void addFunProject(int index) {
    userFunProjects.add(UserFunProjects(
        projectName: '', projectDescription: '', projectLink: ''));

    funProjectNameController.add(TextEditingController());
    funProjectDiscription.add(TextEditingController());
    funProjectLinkController.add(TextEditingController());
  }

  void updateFunProject(int index) {
    userFunProjects[index] = userFunProjects[index].copyWith(
      projectName: funProjectNameController[index].text,
      projectDescription: funProjectDiscription[index].text,
      projectLink: funProjectLinkController[index].text,
    );
  }

  void removeFunProject(int index) {
    userFunProjects.removeAt(index);
    funProjectNameController[index].dispose();
    funProjectDiscription[index].dispose();
    funProjectLinkController[index].dispose();

    funProjectNameController.removeAt(index);
    funProjectDiscription.removeAt(index);
    funProjectLinkController.removeAt(index);
  }
}
