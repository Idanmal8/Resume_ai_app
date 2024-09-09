import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ResumeContainer extends StatelessWidget {
  final String resumeImage;

  const ResumeContainer({
    required this.resumeImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      color: Colors.grey,
      dashPattern: const [5, 5],  
      child: Container(
        alignment: AlignmentDirectional.center,
        color: Colors.grey[200],
        child: const Icon(Icons.file_copy, size: 40, color: Colors.grey)),
    );
  }
}
