// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserSocialMedia {
  final String? linkedIn;
  final String? github;
  final String? twitter;
  final String? facebook;
  final String? instagram;
  final String? tiktok;
  UserSocialMedia({
    required this.linkedIn,
    required this.github,
    required this.twitter,
    required this.facebook,
    required this.instagram,
    required this.tiktok,
  });

  UserSocialMedia copyWith({
    String? linkedIn,
    String? github,
    String? twitter,
    String? facebook,
    String? instagram,
    String? tiktok,
  }) {
    return UserSocialMedia(
      linkedIn: linkedIn ?? this.linkedIn,
      github: github ?? this.github,
      twitter: twitter ?? this.twitter,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      tiktok: tiktok ?? this.tiktok,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'linkedIn': linkedIn,
      'github': github,
      'twitter': twitter,
      'facebook': facebook,
      'instagram': instagram,
      'tiktok': tiktok,
    };
  }

  factory UserSocialMedia.fromMap(Map<String, dynamic> map) {
    return UserSocialMedia(
      linkedIn: map['linkedIn'] as String,
      github: map['github'] as String,
      twitter: map['twitter'] as String,
      facebook: map['facebook'] as String,
      instagram: map['instagram'] as String,
      tiktok: map['tiktok'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSocialMedia.fromJson(String source) =>
      UserSocialMedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserSocialMedia(linkedIn: $linkedIn, github: $github, twitter: $twitter, facebook: $facebook, instagram: $instagram, tiktok: $tiktok)';
  }

  @override
  bool operator ==(covariant UserSocialMedia other) {
    if (identical(this, other)) return true;

    return other.linkedIn == linkedIn &&
        other.github == github &&
        other.twitter == twitter &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.tiktok == tiktok;
  }

  @override
  int get hashCode {
    return linkedIn.hashCode ^
        github.hashCode ^
        twitter.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        tiktok.hashCode;
  }
}
