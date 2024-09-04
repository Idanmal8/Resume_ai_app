// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:resume_ai_app/models/enum/degree.dart';

class UserEducation {
  final String schoolName;
  final String field;
  final String degree;
  final String startDate;
  final String endDate;
  UserEducation({
    required this.schoolName,
    required this.field,
    required this.degree,
    required this.startDate,
    required this.endDate,
  });

  UserEducation copyWith({
    String? schoolName,
    String? field,
    String? degree,
    String? startDate,
    String? endDate,
  }) {
    return UserEducation(
      schoolName: schoolName ?? this.schoolName,
      field: field ?? this.field,
      degree: degree ?? this.degree,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName': schoolName,
      'field': field, 
      'degree': degree,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory UserEducation.fromMap(Map<String, dynamic> map) {
    return UserEducation(
      schoolName: map['schoolName'] as String,
      field: map['field'] as String,
      degree: map['degree'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEducation.fromJson(String source) =>
      UserEducation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserEducation(schoolName: $schoolName, degree: $degree, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant UserEducation other) {
    if (identical(this, other)) return true;

    return other.schoolName == schoolName &&
        other.degree == degree &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return schoolName.hashCode ^
        degree.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
