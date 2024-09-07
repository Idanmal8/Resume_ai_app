import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resume_ai_app/models/user_information.dart';
import 'package:resume_ai_app/utils/constant/keys.dart';

class GeminiService {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: Keys.geminiApiKey,
    generationConfig: GenerationConfig(responseMimeType: 'application/json'),
  );

  Future<UserInformation> generateContent(
      UserInformation userInformation) async {
    // Check if the userInformation is null
    final prompt = '''
    I want you to be a resume builder and to help me take this user information:
    ${userInformation.toJson().toString()}

now it is very important to return in a json the same keys with new values of your desire. What you think should stay the same, keep it the same, but you have to generate these attributes in the most professional way possible:

about me, projects descriptions, userExperience description.

This output in the json should be the best there is so the user will feel like you actually made them the most reliable and experienced in their field.

Two key things you should always DO:
1) Return only the JSON with no further words
2) DO NOT CHANGE the model in any way

(do not put the startDate and endDate together, keep them as is)
  ''';

    final response = await model.generateContent([Content.text(prompt)]);

    print(response.text);

    // Assuming the response is in valid JSON format, parse the response
    final updatedUserInformation =
        UserInformation.fromJson(response.text ?? '');

    print(response.text);
    return updatedUserInformation;
  }
}