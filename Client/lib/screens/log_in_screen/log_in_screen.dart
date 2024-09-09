import 'package:flutter/material.dart';
import 'package:resume_ai_app/screens/log_in_screen/widgets/log_in_box.dart';
import 'package:resume_ai_app/screens/log_in_screen/widgets/resume_background.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeHeight = MediaQuery.of(context).size.height * 0.2;
    final resumeWidth = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: resumeHeight * 2, // Constrain the height
            child: Row(
              children: [
                ResumeBackground(
                  resumeWidth: resumeWidth,
                  resumeHeight: resumeHeight,
                  scrollDirection: ScrollDirection.bottomToTop,
                ),
                const SizedBox(width: 20),
                ResumeBackground(
                  resumeWidth: resumeWidth,
                  resumeHeight: resumeHeight,
                  scrollDirection: ScrollDirection.topToBottom,
                ),
                const SizedBox(width: 20),
                ResumeBackground(
                  resumeWidth: resumeWidth,
                  resumeHeight: resumeHeight,
                  scrollDirection: ScrollDirection.bottomToTop,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: LogInBox(),
          )
        ],
      ),
    );
  }
}


