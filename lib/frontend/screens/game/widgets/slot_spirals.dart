import 'package:flutter/material.dart';
import 'dart:math' as math;

class Spiral extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final bool isLeftFacing;

  const Spiral({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.grey,
    this.isLeftFacing = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _SpiralPainter(color: color, isLeftFacing: isLeftFacing),
    );
  }
}

class _SpiralPainter extends CustomPainter {
  final Color color;
  final bool isLeftFacing;

  _SpiralPainter({required this.color, required this.isLeftFacing});

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 13;

    final centerX = size.width / 2;
    final centerY = size.height;
    final center = Offset(centerX, centerY);
    final radius = math.min(size.width, size.height) / 2;

    final path = Path();
    for (double i = math.pi; i <= 2.5 * math.pi; i += 0.1) {
      double r = radius * (1 - 0.1 * (i - math.pi) / math.pi);
      double x = center.dx + r * math.cos(i);
      double y = center.dy + r * math.sin(i);

      if (isLeftFacing) {
        x = center.dx - r * math.cos(i);
      }

      if (i == math.pi) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
