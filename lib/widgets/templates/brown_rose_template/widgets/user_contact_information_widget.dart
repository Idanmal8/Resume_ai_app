import 'package:flutter/material.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class UserContactBrownRoseWidget extends StatelessWidget {
  final String phoneNumber;
  final String email;
  final String portfolio;
  final String location;

  const UserContactBrownRoseWidget({
    required this.phoneNumber,
    required this.email,
    required this.portfolio,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                color: ResumeBrownRoseColors().brownRose,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.phone,
                    size: 8,
                  ),
                )),
            const SizedBox(width: 8),
            Text(phoneNumber, style: const TextStyle(fontSize: 4)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
                color: ResumeBrownRoseColors().brownRose,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.email,
                    size: 8,
                  ),
                )),
            const SizedBox(width: 8),
            Text(email, style: const TextStyle(fontSize: 4)),
          ],
        ),
        if (portfolio != '') const SizedBox(height: 8),
        if (portfolio != '')
          Row(
            children: [
              Container(
                  color: ResumeBrownRoseColors().brownRose,
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.link,
                      size: 8,
                    ),
                  )),
              const SizedBox(width: 8),
              Text(portfolio, style: const TextStyle(fontSize: 4)),
            ],
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
                color: ResumeBrownRoseColors().brownRose,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.location_on,
                    size: 8,
                  ),
                )),
            const SizedBox(width: 8),
            Text(location, style: const TextStyle(fontSize: 4)),
          ],
        ),
      ],
    );
  }
}
