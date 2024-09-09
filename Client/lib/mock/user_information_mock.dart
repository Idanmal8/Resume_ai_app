import 'package:resume_ai_app/models/user_education.dart';
import 'package:resume_ai_app/models/user_expirience.dart';
import 'package:resume_ai_app/models/user_fun_projects.dart';
import 'package:resume_ai_app/models/user_professional_projects.dart';
import 'package:resume_ai_app/models/user_refrences.dart';
import 'package:resume_ai_app/models/user_social_media.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/models/enum/degree.dart';

UserInformation createMockUserInformation() {
  // Mock UserSocialMedia
  UserSocialMedia userSocialMedia = UserSocialMedia(
    linkedIn: 'https://www.linkedin.com/in/mockuser',
    github: 'https://github.com/mockuser',
    twitter: 'https://twitter.com/mockuser',
    facebook: 'https://www.facebook.com/mockuser',
    instagram: 'https://www.instagram.com/mockuser',
    tiktok: 'https://www.tiktok.com/@mockuser',
  );

  // Mock UserExperience
  List<UserExpirience> userExperiences = [
    UserExpirience(
      companyName: 'Mock Company A',
      position: 'Software Engineer',
      startDate: '2020',
      endDate: '2021',
      description: 'Developed and maintained various applications.',
    ),
    UserExpirience(
      companyName: 'Mock Company B',
      position: 'Junior Developer',
      startDate: '2018',
      endDate: '2019',
      description: 'Assisted in the development of web applications.',
    ),
  ];

  // Mock UserEducation
  List<UserEducation> userEducations = [
    UserEducation(
      schoolName: 'Mock University',
      field: 'Computer Science',
      degree: Degree.Bachlors.name,
      startDate: '2014',
      endDate: '2018',
    ),
  ];

  // Mock UserFunProjects
  List<UserFunProjects> userFunProjects = [
    UserFunProjects(
      projectName: 'Mock Fun Project 1',
      projectDescription: 'A fun project to learn Flutter.',
      projectLink: 'https://github.com/mockuser/funproject1',
    ),
  ];

  // Mock UserProfessionalProjects
  List<UserProfessionalProjects> userProfessionalProjects = [
    UserProfessionalProjects(
      projectName: 'Mock Professional Project 1',
      projectDescription: 'A professional project developed for a client.',
      projectLink: 'https://github.com/mockuser/professionalproject1',
    ),
  ];

  // Mock UserRefrences
  List<UserRefrences> userRefrences = [
    UserRefrences(
      fullName: 'Mock Reference 1',
      phoneNumber: '+1234567890',
      profession: 'Software Developer',
      email: ''
    ),
  ];

  // Mock UserInformation
  UserInformation mockUserInformation = UserInformation(
    fullName: 'Mock User',
    phoneNumber: '+1234567890',
    email: 'mockuser@example.com',
    profeesion: 'Software Developer',
    location: 'Mock City, Mock Country',
    userScocialMedia: userSocialMedia,
    aboutMe: 'I am a passionate developer with experience in mobile and web applications.',
    softSkills: ['Teamwork', 'Communication', 'Problem-Solving'],
    technicalSkills: ['Java', 'Python', 'JavaScript', 'Dart'],
    userExpirience: userExperiences,
    userEducation: userEducations,
    userFunProjects: userFunProjects,
    userProfessionalProjects: userProfessionalProjects,
    // userRefrences: userRefrences,
    languages: ['English', 'Spanish'],
  );

  return mockUserInformation;
}