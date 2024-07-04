import 'package:flutter/material.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;
  final Widget? cursor;

  const CustomCursor({
    required this.child,
    required this.cursor,
    super.key,
  });

  @override
  CustomCursorState createState() => CustomCursorState();
}

class CustomCursorState extends State<CustomCursor> {
  Offset _cursorPosition = Offset.zero;

  void _updateCursorPosition(PointerEvent details) {
    setState(() {
      _cursorPosition = details.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updateCursorPosition,
      cursor: SystemMouseCursors.none, // Hide the default cursor
      child: Stack(
        children: [
          widget.child,
          Positioned(
            left: _cursorPosition.dx,
            top: _cursorPosition.dy,
            child: widget.cursor ?? Container(),
          ),
        ],
      ),
    );
  }
}
