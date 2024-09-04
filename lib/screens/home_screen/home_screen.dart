import 'package:flutter/material.dart';
import 'package:resume_ai_app/screens/resume_form_screen/resume_form_screen.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';
import 'package:resume_ai_app/widgets/resume_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My resumes'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ResumeContainer(
              resumeImage: '',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors().mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ResumeFormScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
