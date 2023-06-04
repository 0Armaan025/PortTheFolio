// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserPortfolio {
  final String name;
  final String email;
  final String profession;
  final String experience;
  final String internExperience;
  final String project1Title;
  final String project1Overview;
  final String project2Title;
  final String project2Overview;
  final String journeyStory;
  final String theme;
  UserPortfolio({
    required this.name,
    required this.email,
    required this.profession,
    required this.experience,
    required this.internExperience,
    required this.project1Title,
    required this.project1Overview,
    required this.project2Title,
    required this.project2Overview,
    required this.journeyStory,
    required this.theme,
  });

  UserPortfolio copyWith({
    String? name,
    String? email,
    String? profession,
    String? experience,
    String? internExperience,
    String? project1Title,
    String? project1Overview,
    String? project2Title,
    String? project2Overview,
    String? journeyStory,
    String? theme,
  }) {
    return UserPortfolio(
      name: name ?? this.name,
      email: email ?? this.email,
      profession: profession ?? this.profession,
      experience: experience ?? this.experience,
      internExperience: internExperience ?? this.internExperience,
      project1Title: project1Title ?? this.project1Title,
      project1Overview: project1Overview ?? this.project1Overview,
      project2Title: project2Title ?? this.project2Title,
      project2Overview: project2Overview ?? this.project2Overview,
      journeyStory: journeyStory ?? this.journeyStory,
      theme: theme ?? this.theme,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'profession': profession,
      'experience': experience,
      'internExperience': internExperience,
      'project1Title': project1Title,
      'project1Overview': project1Overview,
      'project2Title': project2Title,
      'project2Overview': project2Overview,
      'journeyStory': journeyStory,
      'theme': theme,
    };
  }

  factory UserPortfolio.fromMap(Map<String, dynamic> map) {
    return UserPortfolio(
      name: map['name'] as String,
      email: map['email'] as String,
      profession: map['profession'] as String,
      experience: map['experience'] as String,
      internExperience: map['internExperience'] as String,
      project1Title: map['project1Title'] as String,
      project1Overview: map['project1Overview'] as String,
      project2Title: map['project2Title'] as String,
      project2Overview: map['project2Overview'] as String,
      journeyStory: map['journeyStory'] as String,
      theme: map['theme'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPortfolio.fromJson(String source) =>
      UserPortfolio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserPortfolio(name: $name, email: $email, profession: $profession, experience: $experience, internExperience: $internExperience, project1Title: $project1Title, project1Overview: $project1Overview, project2Title: $project2Title, project2Overview: $project2Overview, journeyStory: $journeyStory, theme: $theme)';
  }

  @override
  bool operator ==(covariant UserPortfolio other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.profession == profession &&
        other.experience == experience &&
        other.internExperience == internExperience &&
        other.project1Title == project1Title &&
        other.project1Overview == project1Overview &&
        other.project2Title == project2Title &&
        other.project2Overview == project2Overview &&
        other.journeyStory == journeyStory &&
        other.theme == theme;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        profession.hashCode ^
        experience.hashCode ^
        internExperience.hashCode ^
        project1Title.hashCode ^
        project1Overview.hashCode ^
        project2Title.hashCode ^
        project2Overview.hashCode ^
        journeyStory.hashCode ^
        theme.hashCode;
  }
}
