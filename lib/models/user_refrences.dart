// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserRefrences {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String profession;
  UserRefrences({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.profession,
  });

  UserRefrences copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? profession,
  }) {
    return UserRefrences(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profession: profession ?? this.profession,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'profession': profession,
    };
  }

  factory UserRefrences.fromMap(Map<String, dynamic> map) {
    return UserRefrences(
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      profession: map['profession'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRefrences.fromJson(String source) => UserRefrences.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserRefrences(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, profession: $profession)';
  }

  @override
  bool operator ==(covariant UserRefrences other) {
    if (identical(this, other)) return true;
  
    return 
      other.fullName == fullName &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      other.profession == profession;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      profession.hashCode;
  }
}
