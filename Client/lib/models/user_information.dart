// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:resume_ai_app/models/user_education.dart';
import 'package:resume_ai_app/models/user_expirience.dart';
import 'package:resume_ai_app/models/user_fun_projects.dart';
import 'package:resume_ai_app/models/user_professional_projects.dart';
import 'package:resume_ai_app/models/user_refrences.dart';
import 'package:resume_ai_app/models/user_social_media.dart';

class UserInformation {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String location;
  final String profeesion;
  final UserSocialMedia userScocialMedia;
  final String aboutMe;
  final List<String> softSkills;
  final List<String> technicalSkills;
  final List<UserExpirience> userExpirience;
  final List<UserEducation> userEducation;
  final List<UserFunProjects> userFunProjects;
  final List<UserProfessionalProjects> userProfessionalProjects;
  // final List<UserRefrences> userRefrences;
  final List<String> languages;
  UserInformation({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.profeesion,
    required this.userScocialMedia,
    required this.aboutMe,
    required this.softSkills,
    required this.technicalSkills,
    required this.userExpirience,
    required this.userEducation,
    required this.userFunProjects,
    required this.userProfessionalProjects,
    // required this.userRefrences,
    required this.languages,
  });

  UserInformation copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? location,
    String? profeesion,
    UserSocialMedia? userScocialMedia,
    String? aboutMe,
    List<String>? softSkills,
    List<String>? technicalSkills,
    List<UserExpirience>? userExpirience,
    List<UserEducation>? userEducation,
    List<UserFunProjects>? userFunProjects,
    List<UserProfessionalProjects>? userProfessionalProjects,
    List<UserRefrences>? userRefrences,
    List<String>? languages,
  }) {
    return UserInformation(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      location: location ?? this.location,
      profeesion: profeesion ?? this.profeesion,
      userScocialMedia: userScocialMedia ?? this.userScocialMedia,
      aboutMe: aboutMe ?? this.aboutMe,
      softSkills: softSkills ?? this.softSkills,
      technicalSkills: technicalSkills ?? this.technicalSkills,
      userExpirience: userExpirience ?? this.userExpirience,
      userEducation: userEducation ?? this.userEducation,
      userFunProjects: userFunProjects ?? this.userFunProjects,
      userProfessionalProjects:
          userProfessionalProjects ?? this.userProfessionalProjects,
      // userRefrences: userRefrences ?? this.userRefrences,
      languages: languages ?? this.languages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'location': location,
      'profeesion': profeesion,
      'userScocialMedia': userScocialMedia.toMap(),
      'aboutMe': aboutMe,
      'softSkills': softSkills,
      'technicalSkills': technicalSkills,
      'userExpirience': userExpirience.map((x) => x.toMap()).toList(),
      'userEducation': userEducation.map((x) => x.toMap()).toList(),
      'userFunProjects': userFunProjects.map((x) => x.toMap()).toList(),
      'userProfessionalProjects':
          userProfessionalProjects.map((x) => x.toMap()).toList(),
      // 'userRefrences': userRefrences.map((x) => x.toMap()).toList(),
      'languages': languages,
    };
  }

  factory UserInformation.fromMap(Map<String, dynamic> map) {
  return UserInformation(
    fullName: map['fullName'] as String,
    phoneNumber: map['phoneNumber'] as String,
    email: map['email'] as String,
    location: map['location'] as String,
    profeesion: map['profeesion'] as String,
    userScocialMedia: UserSocialMedia.fromMap(map['userScocialMedia'] as Map<String, dynamic>),
    aboutMe: map['aboutMe'] as String,
    softSkills: List<String>.from(map['softSkills'] as List<dynamic>),  // Convert dynamic to String
    technicalSkills: List<String>.from(map['technicalSkills'] as List<dynamic>),  // Convert dynamic to String
    userExpirience: List<UserExpirience>.from(
      (map['userExpirience'] as List<dynamic>).map<UserExpirience>(
        (x) => UserExpirience.fromMap(x as Map<String, dynamic>),
      ),
    ),
    userEducation: List<UserEducation>.from(
      (map['userEducation'] as List<dynamic>).map<UserEducation>(
        (x) => UserEducation.fromMap(x as Map<String, dynamic>),
      ),
    ),
    userFunProjects: List<UserFunProjects>.from(
      (map['userFunProjects'] as List<dynamic>).map<UserFunProjects>(
        (x) => UserFunProjects.fromMap(x as Map<String, dynamic>),
      ),
    ),
    userProfessionalProjects: List<UserProfessionalProjects>.from(
      (map['userProfessionalProjects'] as List<dynamic>).map<UserProfessionalProjects>(
        (x) => UserProfessionalProjects.fromMap(x as Map<String, dynamic>),
      ),
    ),
    // userRefrences: map['userRefrences'].length != 0 ? List<UserRefrences>.from(
    //   (map['userRefrences'] as List<dynamic>).map<UserRefrences>(
    //     (x) => UserRefrences.fromMap(x as Map<String, dynamic>),
    //   ),
    // ) : [],
    languages: List<String>.from(map['languages'] as List<dynamic>),  // Convert dynamic to String
  );
}


  String toJson() => json.encode(toMap());

  factory UserInformation.fromJson(String source) =>
      UserInformation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInformation(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, userScocialMedia: $userScocialMedia, aboutMe: $aboutMe, softSkills: $softSkills, technicalSkills: $technicalSkills, userExpirience: $userExpirience, userEducation: $userEducation, userFunProjects: $userFunProjects, userProfessionalProjects: $userProfessionalProjects, languages: $languages)';
  }

  @override
  bool operator ==(covariant UserInformation other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.userScocialMedia == userScocialMedia &&
        other.aboutMe == aboutMe &&
        listEquals(other.softSkills, softSkills) &&
        listEquals(other.technicalSkills, technicalSkills) &&
        listEquals(other.userExpirience, userExpirience) &&
        listEquals(other.userEducation, userEducation) &&
        listEquals(other.userFunProjects, userFunProjects) &&
        listEquals(other.userProfessionalProjects, userProfessionalProjects) &&
        listEquals(other.languages, languages);
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        userScocialMedia.hashCode ^
        aboutMe.hashCode ^
        softSkills.hashCode ^
        technicalSkills.hashCode ^
        userExpirience.hashCode ^
        userEducation.hashCode ^
        userFunProjects.hashCode ^
        userProfessionalProjects.hashCode ^
        languages.hashCode;
  }
}
