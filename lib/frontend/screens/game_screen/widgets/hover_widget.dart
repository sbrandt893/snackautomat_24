import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverWrapper extends StatefulWidget {
  const HoverWrapper({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isHovered) builder;

  @override
  HoverWrapperState createState() => HoverWrapperState();
}

class HoverWrapperState extends State<HoverWrapper> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.builder(_isHovered),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;
    });
  }
}
