import 'package:flutter/material.dart';

class ScrollingTextContainer extends StatefulWidget {
  final String text;
  final Duration duration;
  final Duration pauseDuration;
  final double fontSize;
  final double containerHeight;
  final double containerWidth;

  const ScrollingTextContainer({
    super.key,
    required this.text,
    this.duration = const Duration(seconds: 10),
    this.pauseDuration = const Duration(seconds: 2),
    this.fontSize = 18,
    this.containerHeight = 50,
    this.containerWidth = 150,
  });

  @override
  ScrollingTextContainerState createState() => ScrollingTextContainerState();
}

class ScrollingTextContainerState extends State<ScrollingTextContainer> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this, duration: widget.duration);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _startAnimation() async {
    while (mounted) {
      // Überprüfen Sie, ob das Widget noch gemountet ist
      await Future.delayed(widget.pauseDuration);
      if (_scrollController.hasClients) {
        final maxExtent = _scrollController.position.maxScrollExtent;
        if (mounted) {
          // Erneute Überprüfung vor der Animation
          await _scrollController.animateTo(
            maxExtent,
            duration: widget.duration,
            curve: Curves.linear,
          );
        }
        await Future.delayed(widget.pauseDuration);
        if (mounted && _scrollController.hasClients) {
          // Überprüfung vor dem Zurückspringen
          _scrollController.jumpTo(0);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      height: widget.containerHeight,
      width: widget.containerWidth,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
