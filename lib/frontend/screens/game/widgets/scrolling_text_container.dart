import 'package:flutter/material.dart';

class ScrollingTextContainer extends StatefulWidget {
  final ScrollController controller;
  final String text;
  final Duration textSpeed;
  final Duration pauseDuration;
  final double fontSize;
  final double containerHeight;
  final double containerWidth;

  const ScrollingTextContainer({
    super.key,
    required this.controller,
    required this.text,
    this.textSpeed = const Duration(milliseconds: 1500),
    this.pauseDuration = const Duration(milliseconds: 1500),
    this.fontSize = 18,
    this.containerHeight = 50,
    this.containerWidth = 150,
  });

  @override
  ScrollingTextContainerState createState() => ScrollingTextContainerState();
}

class ScrollingTextContainerState extends State<ScrollingTextContainer> with SingleTickerProviderStateMixin {
  bool _isPaused = false;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _currentText = widget.text;
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAnimation());
  }

  @override
  void didUpdateWidget(ScrollingTextContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      print('Text changed - old: ${oldWidget.text}, new: ${widget.text}');
      _currentText = widget.text;
      _restartAnimation();
    }
  }

  void _startAnimation() async {
    while (mounted && !_isPaused) {
      await Future.delayed(widget.pauseDuration);
      if (widget.controller.hasClients) {
        final maxExtent = widget.controller.position.maxScrollExtent;
        if (mounted && !_isPaused) {
          await widget.controller.animateTo(
            maxExtent,
            duration: widget.textSpeed,
            curve: Curves.linear,
          );
        }
        await Future.delayed(widget.pauseDuration);
        if (mounted && widget.controller.hasClients && !_isPaused) {
          widget.controller.jumpTo(0);
        }
      }
    }
  }

  void _restartAnimation() {
    widget.controller.jumpTo(0);
    if (_isPaused) {
      _isPaused = false;
      _startAnimation();
    }
  }

  void togglePause() {
    setState(() {
      _isPaused = !_isPaused;
      if (!_isPaused) _startAnimation();
    });
  }

  void scrollToPosition(double position) {
    if (widget.controller.hasClients) {
      widget.controller.jumpTo(position);
    }
  }

  @override
  void dispose() {
    // widget.controller.dispose(); // Entferne diesen Aufruf, um den Controller nicht zu schließen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BUILDING SCROLLING TEXT CONTAINER');
    return Container(
      color: Colors.black.withOpacity(0.1),
      height: widget.containerHeight,
      width: widget.containerWidth,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: widget.controller,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              _currentText,
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
