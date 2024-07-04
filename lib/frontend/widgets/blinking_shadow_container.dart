import 'package:flutter/material.dart';

class BlinkingBoxShadow extends StatefulWidget {
  final Widget child;
  const BlinkingBoxShadow({required this.child, super.key});

  @override
  BlinkingBoxShadowState createState() => BlinkingBoxShadowState();
}

class BlinkingBoxShadowState extends State<BlinkingBoxShadow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade700.withOpacity(_animation.value),
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}
