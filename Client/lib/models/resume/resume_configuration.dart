// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/providers/designated_screen_view_model/designated_screen_view_model.dart';

class ResumeConfiguration {
  final ResumeKind kind;
  final String role;
  final String jobDescription;
  final UserInformation? userInformation;
  ResumeConfiguration({
    required this.kind,
    required this.role,
    required this.jobDescription,
    this.userInformation,
  });

  ResumeConfiguration copyWith({
    ResumeKind? kind,
    String? role,
    String? jobDescription,
    UserInformation? userInformation,
  }) {
    return ResumeConfiguration(
      kind: kind ?? this.kind,
      role: role ?? this.role,
      jobDescription: jobDescription ?? this.jobDescription,
      userInformation: userInformation ?? this.userInformation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'role': role,
      'jobDescription': jobDescription,
      'userInformation': userInformation?.toMap(),
    };
  }

  factory ResumeConfiguration.fromMap(Map<String, dynamic> map) {
    return ResumeConfiguration(
      kind: map['kind'] as ResumeKind,
      role: map['role'] as String,
      jobDescription: map['jobDescription'] as String,
      userInformation: UserInformation.fromMap(map['userInformation'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumeConfiguration.fromJson(String source) =>
      ResumeConfiguration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResumeConfiguration(kind: $kind, role: $role, jobDescription: $jobDescription, userInformation: $userInformation)';

  @override
  bool operator ==(covariant ResumeConfiguration other) {
    if (identical(this, other)) return true;
  
    return 
      other.kind == kind &&
      other.role == role &&
      other.jobDescription == jobDescription;
  }

  @override
  int get hashCode => kind.hashCode ^ role.hashCode ^ jobDescription.hashCode;
}
