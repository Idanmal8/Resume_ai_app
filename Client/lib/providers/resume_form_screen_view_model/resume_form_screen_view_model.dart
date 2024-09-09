import 'package:flutter/material.dart';
import 'package:resume_ai_app/models/enum/degree.dart';
import 'package:resume_ai_app/models/resume/resume_configuration.dart';
import 'package:resume_ai_app/models/user_education.dart';
import 'package:resume_ai_app/models/user_expirience.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/models/user_professional_projects.dart';
import 'package:resume_ai_app/models/user_social_media.dart';
import 'package:resume_ai_app/providers/designated_screen_view_model/designated_screen_view_model.dart';
import 'package:resume_ai_app/screens/output_screen/output_screen.dart';
import 'package:resume_ai_app/utils/mixin/about_me_mixin.dart';
import 'package:resume_ai_app/utils/mixin/education_information_mixin.dart';
import 'package:resume_ai_app/utils/mixin/expirience_information_mixin.dart';
import 'package:resume_ai_app/utils/mixin/personal_information_mixin.dart';
import 'package:resume_ai_app/utils/mixin/projects_mixin.dart';

class ResumeFormScreenViewModel extends ChangeNotifier
    with
        PersonalInformationMixin,
        ExpirienceInformationMixin,
        AboutMeMixin,
        EducationInformationMixin,
        ProjectsMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController softSkillController = TextEditingController();

  // Skill management
  List<String> skills = [];
  List<String> softSkills = [];
  int _stepIndex = 0;
  bool _isLoading = false;
  bool _hasError = false; // New flag to track errors
  String _errorMessage = ''; // New variable to store error message

  bool get isLoading => _isLoading;
  int get stepIndex => _stepIndex;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  void nextStep() {
    _stepIndex++;
    notifyListeners();
  }

  void previousStep() {
    _stepIndex--;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void addSkill() {
    final String newSkill = skillController.text.trim();
    if (newSkill.isNotEmpty && !skills.contains(newSkill)) {
      skills.add(newSkill);
      notifyListeners();
    }
    skillController.clear();
  }

  void removeSkill(String skill) {
    skills.remove(skill);
    notifyListeners();
  }

  void addSoftSkill() {
    final String newSkill = softSkillController.text.trim();
    if (newSkill.isNotEmpty && !softSkills.contains(newSkill)) {
      softSkills.add(newSkill);
      notifyListeners();
    }
    softSkillController.clear();
  }

  void removeSoftSkill(String skill) {
    softSkills.remove(skill);
    notifyListeners();
  }

  // Factory method to add a new experience form
  void addExperience() {
    experiences.add(UserExpirience(
      companyName: '',
      position: '',
      startDate: '',
      endDate: '',
      description: '',
    ));
    companyNameControllers.add(TextEditingController());
    positionControllers.add(TextEditingController());
    startDateControllers.add(TextEditingController());
    endDateControllers.add(TextEditingController());
    descriptionControllers.add(TextEditingController());
    notifyListeners();
  }

  // Method to remove an experience form
  void removeExperience(int index) {
    experiences.removeAt(index);
    companyNameControllers[index].dispose();
    positionControllers[index].dispose();
    startDateControllers[index].dispose();
    endDateControllers[index].dispose();
    descriptionControllers[index].dispose();

    companyNameControllers.removeAt(index);
    positionControllers.removeAt(index);
    startDateControllers.removeAt(index);
    endDateControllers.removeAt(index);
    descriptionControllers.removeAt(index);
    notifyListeners();
  }

  // Method to update the UserExperience object when the text fields change
  void updateExperience(int index) {
    experiences[index] = experiences[index].copyWith(
      companyName: companyNameControllers[index].text,
      position: positionControllers[index].text,
      startDate: startDateControllers[index].text,
      endDate: endDateControllers[index].text,
      description: descriptionControllers[index].text,
    );
  }

  //factory method to add a new education form
  void addEducation() {
    education.add(
      UserEducation(
        schoolName: '',
        field: '',
        degree: Degree.Bachlors.name,
        startDate: '',
        endDate: '',
      ),
    );
    schoolNameControllers.add(TextEditingController());
    degreeControllers.add(TextEditingController());
    fieldOfStudyControllers.add(TextEditingController());
    startDateEducationControllers.add(TextEditingController());
    endDateEducationControllers.add(TextEditingController());
    descriptionControllers.add(TextEditingController());
    notifyListeners();
  }

  // Method to remove an education form
  void removeEducation(int index) {
    education.removeAt(index);
    schoolNameControllers[index].dispose();
    fieldOfStudyControllers[index].dispose();
    degreeControllers[index].dispose();
    startDateEducationControllers[index].dispose();
    endDateEducationControllers[index].dispose();
    descriptionControllers[index].dispose();

    schoolNameControllers.removeAt(index);
    fieldOfStudyControllers.removeAt(index);
    degreeControllers.removeAt(index);
    startDateEducationControllers.removeAt(index);
    endDateEducationControllers.removeAt(index);
    descriptionControllers.removeAt(index);
    notifyListeners();
  }

  // Method to update the UserEducation object when the text fields change
  void updateEducation(int index) {
    education[index] = education[index].copyWith(
      schoolName: schoolNameControllers[index].text,
      degree: degreeControllers[index].text,
      startDate: startDateEducationControllers[index].text,
      endDate: endDateEducationControllers[index].text,
      field: fieldOfStudyControllers[index].text,
    );
  }

  // Method to update the degree field
  void updateDegree(int index, Degree newDegree) {
    education[index] = education[index].copyWith(degree: newDegree.toString());
    notifyListeners();
  }

  // Method to update projects
  void addProProject() {
    addProfessionalProject();
    notifyListeners();
  }

  void removeProProject(int index) {
    removeProfessionalProject(index);
    notifyListeners();
  }

  void updateProProject(int index) {
    updateProfessionalProject(index);
    notifyListeners();
  }

  @override
  void addFunProject(int index) {
    addFunProject(index);
    notifyListeners();
  }

  @override
  void removeFunProject(int index) {
    removeFunProject(index);
    notifyListeners();
  }

  @override
  void updateFunProject(int index) {
    updateFunProject(index);
    notifyListeners();
  }

  //debugPrint all of the information
  void printAllInformation() {
    debugPrint(fullNameController.text);
    debugPrint(emailController.text);
    debugPrint(phoneNumberController.text);
    debugPrint(aboutMeController.text);
    debugPrint(locationController.text);
    for (String skill in skills) {
      debugPrint(skill);
    }
    for (String softSkill in softSkills) {
      debugPrint(softSkill);
    }
    for (UserExpirience expirience in experiences) {
      print(expirience.toMap());
    }
    for (UserEducation education in education) {
      print(education.toMap());
    }
  }

  void setError(String error) {
    _hasError = true;
    _errorMessage = error;
    notifyListeners();

    Future.delayed(const Duration(seconds: 10), () {
      _hasError = false;
      _errorMessage = '';
      notifyListeners();
    });
  }

  void validateStepBeforeMoving() {
    switch (_stepIndex) {
      case 0:
        if (validateEmail() != null ||
            validatePhoneNumber() != null ||
            fullNameController.text.isEmpty ||
            locationController.text.isEmpty ||
            professionController.text.isEmpty) {
          formKey.currentState!.validate();
          setError('Please fill out all required fields correctly');
          return;
        }
        break;
      case 1:
        if (aboutMeController.text.isEmpty) {
          setError('About me must be filled');
          return;
        }
        break;
      case 2:
        break;
      case 3:
        break;
    }
    nextStep();
  }

  void createUserInformation(
      BuildContext context, List<ResumeConfiguration> resumes) {
    for (int i = 0; i < userProfessionalProjects.length; i++) {
      updateProProject(i);
      notifyListeners();
    }
    for(int i = 0; i < userFunProjects.length; i++) {
      updateFunProject(i);
      notifyListeners();
    }
    UserInformation userInformation = UserInformation(
      fullName: fullNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      location: locationController.text,
      profeesion: professionController.text,
      aboutMe: aboutMeController.text,
      technicalSkills: skills,
      softSkills: softSkills,
      userEducation: education,
      userScocialMedia: UserSocialMedia(
        facebook: '',
        linkedIn: linkedInController.text,
        github: githubController.text,
        twitter: twitterController.text,
        tiktok:
            portfolioController.text, // change this to portfolio in the model
        instagram: instagramController.text,
      ),
      userExpirience: experiences,
      userProfessionalProjects: userProfessionalProjects,
      userFunProjects: userFunProjects,
      // userRefrences: [],
      languages: ['English', 'Hebrew'],
    );

    resumes.add(ResumeConfiguration(
      kind: ResumeKind.newResume,
      role: 'General',
      jobDescription: 'General',
      userInformation: userInformation,
    ));
    goToOutcomeScreen(context, userInformation);
  }

  void goToOutcomeScreen(
      BuildContext context, UserInformation userInformation) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OutputScreen()));
  }
}
