import 'package:flutter/material.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class SavedUserInformationListScreen extends StatelessWidget {
  const SavedUserInformationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Information'),
      ),
      body: Column(
        children: [
          // Expanded ensures the list takes up the available space
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Change to dynamic length when needed
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        activeColor: AppColors().mainColor,
                        value: true,
                        onChanged: (value) {
                          // Handle checkbox change
                        },
                      ),
                      title: const Text('User Information'),
                      subtitle: const Text('This is the user information'),
                      onTap: () {
                        // Handle list item tap
                      },
                    ),
                    index == 4
                        ? Container()
                        : const Divider(
                            height: 0,
                          ),
                  ],
                );
              },
            ),
          ),
          // Button stays fixed at the bottom
          Container(
            
            width: double.infinity,
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 48),
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.all(AppColors().mainColor),
              ),
              child: const Text('Generate resume', style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}