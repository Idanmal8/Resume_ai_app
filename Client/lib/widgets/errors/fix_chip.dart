import 'package:flutter/material.dart';

class FixChip extends StatefulWidget {
  final String error;
  const FixChip({super.key, required this.error});

  @override
  State<FixChip> createState() => _FixChipState();
}

class _FixChipState extends State<FixChip> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationPosition;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 4 seconds
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _animationPosition = Tween<double>(begin: -100, end: 30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      ),
    );

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          _controller.reverse().then((_) {
            if (mounted) {
              setState(() {
                _isVisible = false; 
              });
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _animationPosition.value,
                left: 0,
                right: 0,
                child: Card(
                  
                  color: Colors.red[200],
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: Text(widget.error, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ),
                ),
              );
            },
          )
        : const SizedBox.shrink(); // Return an empty widget when it's not visible
  }
}
