import 'dart:math';
import 'package:flutter/material.dart';
import 'package:resume_ai_app/utils/colors/app_colors.dart';

class ChipRole extends StatefulWidget {
  final String role;
  final bool isSelected;
  final Function(String) onTap;

  const ChipRole({
    required this.role,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  _ChipRoleState createState() => _ChipRoleState();
}

class _ChipRoleState extends State<ChipRole>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late int _randomDuration;

  @override
  void initState() {
    super.initState();

    // Generate a random duration between 700 and 1800 milliseconds
    _randomDuration = Random().nextInt(1100) + 700;

    // Initialize the animation controller with the random duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _randomDuration),
    );

    // Create a CurvedAnimation for the bounce effect
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut, // Bounce effect
    );

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FilledButton(
        onPressed: () {
          widget.onTap(widget.role);
        },
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: widget.isSelected
                ? const WidgetStatePropertyAll(Colors.blue)
                : WidgetStatePropertyAll(AppColors().mainColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(widget.role, style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
