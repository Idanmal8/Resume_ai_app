// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserExpirience {
  final String companyName;
  final String position;
  final String startDate;
  final String endDate;
  final String description;
  UserExpirience({
    required this.companyName,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  UserExpirience copyWith({
    String? companyName,
    String? position,
    String? startDate,
    String? endDate,
    String? description,
  }) {
    return UserExpirience(
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'position': position,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
    };
  }

  factory UserExpirience.fromMap(Map<String, dynamic> map) {
    return UserExpirience(
      companyName: map['companyName'] as String,
      position: map['position'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserExpirience.fromJson(String source) => UserExpirience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserExpirience(companyName: $companyName, position: $position, startDate: $startDate, endDate: $endDate, description: $description)';
  }

  @override
  bool operator ==(covariant UserExpirience other) {
    if (identical(this, other)) return true;
  
    return 
      other.companyName == companyName &&
      other.position == position &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.description == description;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
      position.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      description.hashCode;
  }
}
