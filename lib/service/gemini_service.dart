import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/utils/constant/keys.dart';

class GeminiService {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: Keys.geminiApiKey,
    generationConfig: GenerationConfig(responseMimeType: 'application/json'), 
  );
  final prompt = '''
    I want you to be a resume builder and to help me take this user information:
{
  "fullName": "John Doe",
  "phoneNumber": "+1234567890",
  "email": "john.doe@example.com",
  "location": "New York, NY",
  "profeesion": "Software Engineer",
  "userScocialMedia": {
    "linkedIn": "john_doe_linkedin",
    "github": "john_doe_github",
    "twitter": "john_doe_twitter",
    "facebook": "john_doe_facebook",
    "instagram": "john_doe_instagram",
    "tiktok": "john_doe_tiktok"
  },
  "aboutMe": "A passionate software engineer with experience in mobile app development.",
  "softSkills": [
    "Teamwork",
    "Communication",
    "Problem-solving",
    "Time management"
  ],
  "technicalSkills": [
    "Flutter",
    "Dart",
    "JavaScript",
    "Python",
    "Node.js"
  ],
  "userExpirience": [
    {
      "companyName": "TechCorp",
      "position": "Flutter Developer",
      "startDate": "2020-01-01",
      "endDate": "2022-06-30",
      "description": "Developed mobile applications using Flutter and collaborated with backend teams."
    },
    {
      "companyName": "Innovate Inc.",
      "position": "Junior Developer",
      "startDate": "2018-06-01",
      "endDate": "2019-12-31",
      "description": "Assisted in frontend development, debugged, and maintained codebase."
    }
  ],
  "userEducation": [
    {
      "schoolName": "Tech University",
      "field": "Computer Science",
      "degree": "Bachelor of Computer Science",
      "startDate": "2014-09-01",
      "endDate": "2018-06-01"
    }
  ],
  "userFunProjects": [
    {
      "projectName": "Personal Blog",
      "projectDescription": "Created a personal blog using Flutter and Firebase.",
      "projectLink": "https://example.com/personal-blog"
    }
  ],
  "userProfessionalProjects": [
    {
      "projectName": "E-Commerce App",
      "projectDescription": "Developed a full-featured e-commerce app for a retail client.",
      "projectLink": "https://example.com/e-commerce-app"
    }
  ],
  "userRefrences": [
    {
      "fullName": "Jane Smith",
      "phoneNumber": "+0987654321",
      "email": "jane.smith@techcorp.com",
      "profession": "Manager"
    }
  ],
  "languages": [
    "English",
    "Spanish"
  ]
}


now it is very importent to return in a json the same keys with new values of youre desire what you think should stay the same then keep it the same but you have to generate these attributes in the most proffessional way possible :

about me, projects descriptions, userExpirience description

This output in the json should be the best there is so the user will feel like you acctualy made him the most reliable and expirienced in his field 

two key things you should always DO:
1) return only the JSON with no further words
2) DO NOT CHNAGE the model in any way

(do not put the staretdate and end date toghter keep them as is)
  ''';

  Future<UserInformation> generateContent() async {
    final response = await model.generateContent([Content.text(prompt)]);

    print(response.text);

    final UserInformation userInformation = UserInformation.fromJson(response.text ?? '');

    print(response.text);
    return userInformation;
  }
}
