import 'package:flutter/material.dart';
import 'dart:math';

enum ScrollDirection {
  topToBottom,
  bottomToTop,
}

class ResumeBackground extends StatefulWidget {
  const ResumeBackground({
    super.key,
    required this.resumeWidth,
    required this.resumeHeight,
    required this.scrollDirection,
  });

  final double resumeWidth;
  final double resumeHeight;
  final ScrollDirection scrollDirection;

  @override
  ResumeBackgroundState createState() => ResumeBackgroundState();
}

class ResumeBackgroundState extends State<ResumeBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late List<String> _shuffledImages;

  @override
  void initState() {
    super.initState();

    // Initialize the list of images
    List<String> images = List.generate(12, (index) => 'assets/resume/resume${index + 1}.png');

    // Shuffle the images only once
    _shuffledImages = List.from(images)..shuffle(Random());

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 90),
    )..repeat(); // Repeat the animation indefinitely

    // Set up the animation to move from 0 to 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.resumeWidth,   // Ensure the width is constrained
      height: widget.resumeHeight * 4, // Adjust this as necessary
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            clipBehavior: Clip.none, // Prevents clipping of the Positioned widgets
            children: [
              for (int i = 0; i < 15; i++) // Adjust number to create more continuity
                Positioned(
                  top: _calculateTopPosition(i),
                  child: Image.asset(
                    _getShuffledImage(i), // Use the method to get the image from the shuffled list
                    width: widget.resumeWidth,
                    height: widget.resumeHeight,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  String _getShuffledImage(int index) {
    // Get the image in sequence from the shuffled list, restarting when the end is reached
    return _shuffledImages[index % _shuffledImages.length];
  }

  double _calculateTopPosition(int index) {
    double totalHeight = widget.resumeHeight * 10; // Total height of all items
    double scrollPosition = _animation.value * totalHeight;

    // Adjust the direction based on the scrollDirection field
    double offset;
    if (widget.scrollDirection == ScrollDirection.bottomToTop) {
      // Scrolling from bottom to top
      offset = (index * widget.resumeHeight) - scrollPosition;
      if (offset < -widget.resumeHeight) {
        offset += totalHeight;
      }
    } else {
      // Scrolling from top to bottom
      offset = (index * widget.resumeHeight) + scrollPosition - totalHeight - 300;
      if (offset > widget.resumeHeight * 4) {
        offset -= totalHeight;
      }
    }

    // Check if the 10th element is about to reach the screen
    if (index == 10 && (offset <= widget.resumeHeight * 4 && offset >= -widget.resumeHeight)) {
      _easeAndStopAnimation();
    }

    // Ensure that the offset does not make the images disappear when they are still visible
    if (widget.scrollDirection == ScrollDirection.topToBottom) {
      offset += widget.resumeHeight * 2; // Adjust starting position for smoother entry
    }

    return offset;
  }

  void _easeAndStopAnimation() {
    // Gradually slow down the animation
    _controller.duration = const Duration(seconds: 90);
    _controller.forward().then((_) {
      _controller.stop();
    });
  }
}