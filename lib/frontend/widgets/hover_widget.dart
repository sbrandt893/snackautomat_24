import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  const HoverBuilder({
    super.key,
    required this.builder,
    this.onHoverChanged,
  });

  final Widget Function(bool isHovered) builder;
  final void Function(bool isHovered)? onHoverChanged;

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  void _onEnter(PointerEvent event) {
    setState(() {
      _isHovered = true;
    });
    if (widget.onHoverChanged != null) {
      widget.onHoverChanged!(true);
    }
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovered = false;
    });
    if (widget.onHoverChanged != null) {
      widget.onHoverChanged!(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: widget.builder(_isHovered),
    );
  }
}
