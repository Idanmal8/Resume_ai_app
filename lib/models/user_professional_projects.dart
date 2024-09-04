// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfessionalProjects {
    final String projectName;
    final String projectDescription;
    final String? projectLink;
  UserProfessionalProjects({
    required this.projectName,
    required this.projectDescription,
    this.projectLink,
  });

  UserProfessionalProjects copyWith({
    String? projectName,
    String? projectDescription,
    String? projectLink,
  }) {
    return UserProfessionalProjects(
      projectName: projectName ?? this.projectName,
      projectDescription: projectDescription ?? this.projectDescription,
      projectLink: projectLink ?? this.projectLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectName': projectName,
      'projectDescription': projectDescription,
      'projectLink': projectLink,
    };
  }

  factory UserProfessionalProjects.fromMap(Map<String, dynamic> map) {
    return UserProfessionalProjects(
      projectName: map['projectName'] as String,
      projectDescription: map['projectDescription'] as String,
      projectLink: map['projectLink'] != null ? map['projectLink'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfessionalProjects.fromJson(String source) => UserProfessionalProjects.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserProfessionalProjects(projectName: $projectName, projectDescription: $projectDescription, projectLink: $projectLink)';

  @override
  bool operator ==(covariant UserProfessionalProjects other) {
    if (identical(this, other)) return true;
  
    return 
      other.projectName == projectName &&
      other.projectDescription == projectDescription &&
      other.projectLink == projectLink;
  }

  @override
  int get hashCode => projectName.hashCode ^ projectDescription.hashCode ^ projectLink.hashCode;
}
