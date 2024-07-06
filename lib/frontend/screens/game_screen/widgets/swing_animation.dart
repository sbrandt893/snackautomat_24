import 'package:flutter/material.dart';

class SwingAnimation extends StatefulWidget {
  final Widget child;
  final int duration;

  const SwingAnimation({super.key, required this.child, this.duration = 500});

  @override
  SwingAnimationState createState() => SwingAnimationState();
}

class SwingAnimationState extends State<SwingAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -15, end: 15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(_animation.value * 0.0174533), // Convert degrees to radians
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
