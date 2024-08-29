import 'package:flutter/material.dart';

class BrokenGlassPane extends StatelessWidget {
  final double width;
  final double height;

  const BrokenGlassPane({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: ShardPainter(),
    );
  }
}

class ShardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    final paint2 = Paint()
      ..color = Colors.blueGrey.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01;
    final borderPaint2 = Paint()
      ..color = Colors.blueGrey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01;

    // Erste Scherbe (untere rechte Ecke)
    final path1 = Path();
    path1.moveTo(size.width, size.height);
    path1.lineTo(size.width * 0.8, size.height);
    path1.lineTo(size.width * 0.75, size.height * 0.9);
    path1.lineTo(size.width * 0.7, size.height * 0.75);
    path1.lineTo(size.width * 0.85, size.height * 0.85);
    path1.lineTo(size.width * 0.95, size.height * 0.85);
    path1.lineTo(size.width, size.height * 0.8);
    path1.close();
    canvas.drawPath(path1, paint);
    canvas.drawPath(path1, paint2);
    canvas.drawPath(path1, borderPaint);
    canvas.drawPath(path1, borderPaint2);

    // Zweite Scherbe (obere linke Ecke)
    final path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(size.width * 0.2, 0);
    path2.lineTo(size.width * 0.25, size.height * 0.1);
    path2.lineTo(size.width * 0.3, size.height * 0.25);
    path2.lineTo(size.width * 0.15, size.height * 0.15);
    path2.lineTo(size.width * 0.05, size.height * 0.15);
    path2.lineTo(0, size.height * 0.2);
    path2.close();
    canvas.drawPath(path2, paint);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path2, borderPaint);
    canvas.drawPath(path2, borderPaint2);

    // Dritte Scherbe (obere rechte Ecke)
    final path3 = Path();
    path3.moveTo(size.width, 0);
    path3.lineTo(size.width * 0.8, 0);
    path3.lineTo(size.width * 0.75, size.height * 0.1);
    path3.lineTo(size.width * 0.7, size.height * 0.2);
    path3.lineTo(size.width * 0.85, size.height * 0.1);
    path3.lineTo(size.width * 0.95, size.height * 0.05);
    path3.lineTo(size.width, size.height * 0.2);
    path3.close();
    canvas.drawPath(path3, paint);
    canvas.drawPath(path3, paint2);
    canvas.drawPath(path3, borderPaint);
    canvas.drawPath(path3, borderPaint2);

    // Vierte Scherbe (untere linke Ecke)
    final path4 = Path();
    path4.moveTo(0, size.height);
    path4.lineTo(size.width * 0.2, size.height);
    path4.lineTo(size.width * 0.25, size.height * 0.9);
    path4.lineTo(size.width * 0.3, size.height * 0.8);
    path4.lineTo(size.width * 0.15, size.height * 0.9);
    path4.lineTo(size.width * 0.05, size.height * 0.95);
    path4.lineTo(0, size.height * 0.8);
    path4.close();
    canvas.drawPath(path4, paint);
    canvas.drawPath(path4, paint2);
    canvas.drawPath(path4, borderPaint);
    canvas.drawPath(path4, borderPaint2);

    // Zeichnen des äußeren Rahmens
    final borderRect = Rect.fromLTWH(
      borderPaint.strokeWidth / 2,
      borderPaint.strokeWidth / 2,
      size.width - borderPaint.strokeWidth,
      size.height - borderPaint.strokeWidth,
    );
    canvas.drawRect(borderRect, borderPaint);
    canvas.drawRect(borderRect, borderPaint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
