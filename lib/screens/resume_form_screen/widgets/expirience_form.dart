import 'package:flutter/material.dart';

class ExperienceForm extends StatelessWidget {
  final TextEditingController companyNameController;
  final TextEditingController positionController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController descriptionController;
  final Function(String) onChanged;

  const ExperienceForm({
    super.key,
    required this.companyNameController,
    required this.positionController,
    required this.startDateController,
    required this.endDateController,
    required this.descriptionController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: companyNameController,
          onChanged: (String value) {
            onChanged(value);
          },
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            label: Text('Company name'),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: positionController,
          onChanged: (String value) {
            onChanged(value);
          },
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            label: Text('Title'),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: startDateController,
                onChanged: (String value) {
                  onChanged(value);
                },
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  label: Text('Start date (year)'),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: endDateController,
                onChanged: (String value) {
                  onChanged(value);
                },
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  label: Text('End date (year)'),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: descriptionController,
          onChanged: (String value) {
            onChanged(value);
          },
          keyboardType: TextInputType.text,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Description'),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }
}
