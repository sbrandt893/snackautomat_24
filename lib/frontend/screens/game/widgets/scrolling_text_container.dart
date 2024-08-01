import 'package:flutter/material.dart';

class ScrollingTextContainer extends StatefulWidget {
  final String text;
  final double speed; // Pixel pro Sekunde
  final Duration pauseDuration;
  final double fontSize;
  final double containerHeight;
  final double containerWidth;

  const ScrollingTextContainer({
    Key? key,
    required this.text,
    this.speed = 50, // Standardgeschwindigkeit
    this.pauseDuration = const Duration(seconds: 1),
    this.fontSize = 18,
    this.containerHeight = 40,
    this.containerWidth = 150,
  }) : super(key: key);

  @override
  ScrollingTextContainerState createState() => ScrollingTextContainerState();
}

class ScrollingTextContainerState extends State<ScrollingTextContainer> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final textWidth = _calculateTextWidth();
      final totalDistance = textWidth + widget.containerWidth;
      final duration = Duration(milliseconds: (totalDistance / widget.speed * 1000).round());

      _animationController = AnimationController(vsync: this, duration: duration);
      _animation = Tween<double>(begin: 0, end: textWidth).animate(_animationController)
        ..addListener(() {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_animation.value);
          }
        });

      _startAnimation();
    });
  }

  double _calculateTextWidth() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: TextStyle(fontSize: widget.fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }

  void _startAnimation() async {
    while (mounted) {
      await Future.delayed(widget.pauseDuration);
      if (!mounted) return;
      await _animationController.forward();
      if (!mounted) return;
      await Future.delayed(widget.pauseDuration);
      if (!mounted) return;
      _animationController.reset();
    }
  }

  @override
  void didUpdateWidget(ScrollingTextContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text || oldWidget.speed != widget.speed) {
      _animationController.dispose();
      _initializeAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
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
          physics: NeverScrollableScrollPhysics(),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
