import 'package:flutter/material.dart';
import 'package:resume_ai_app/screens/designated_role_screen/designated_role_screen.dart';

class ResumeKindScreen extends StatelessWidget {
  const ResumeKindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose configuration'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            child: ListTile(          
              title: const Text('Designated role', textAlign: TextAlign.center,),
              subtitle: const Text('Choose a role and we will help\nyou create a resume for it', textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DesignatedRoleScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            child: ListTile(
              title: const Text('General resume', textAlign: TextAlign.center,),
              subtitle: const Text('Create a resume from scratch\nwith no specific role in mind', textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DesignatedRoleScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}