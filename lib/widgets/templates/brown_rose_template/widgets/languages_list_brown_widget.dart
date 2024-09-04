import 'package:resume_ai_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LanguagesListBrownWidget extends StatelessWidget {
  final List<String> languages;

  const LanguagesListBrownWidget({
    required this.languages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ResumeBrownRoseColors().brownRose,
          child: const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 2, right: 16),
                  child: Text(
                    'Languages',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...languages.map((languages) {
          return Text(languages, style: const TextStyle(fontSize: 4));
        })
      ],
    );
  }
}
