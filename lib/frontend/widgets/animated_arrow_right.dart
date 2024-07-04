import 'package:flutter/material.dart';

class WobbleHorizontal extends StatefulWidget {
  final Widget child;
  final int duration;
  final bool reversed;

  const WobbleHorizontal({super.key, required this.child, this.duration = 500, this.reversed = false});

  @override
  WobbleHorizontalState createState() => WobbleHorizontalState();
}

class WobbleHorizontalState extends State<WobbleHorizontal> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: widget.reversed ? 10 : -10, end: widget.reversed ? -10 : 10).animate(
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
          return Transform.translate(
            offset: Offset(_animation.value, 0),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
