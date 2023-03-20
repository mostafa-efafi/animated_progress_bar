import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CircleShape extends CustomPainter {
  static const backColor = Colors.black12;
  late Paint _paint;
  late Paint _staticPaint;
  double? fraction;
  Color? color;
  double? staticFraction;
  double? stroke;
  final PaintingStyle? style;

  CircleShape({
    this.fraction,
    this.color,
    this.staticFraction,
    this.stroke,
    this.style,
  }) {
    _staticPaint = Paint()
      ..color = backColor
      ..strokeWidth = stroke ?? 4
      ..strokeCap = StrokeCap.round
      ..style = style ?? PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);
    _paint = Paint()
      ..color = color ?? Colors.grey
      ..shader = color == null
          ? ui.Gradient.sweep(
              offset,
              [
                Colors.red.shade700,
                Colors.red,
                Colors.orange,
                const Color(0xFF64d506)
              ],
              [
                0.1,
                0.3,
                0.6,
                0.9,
              ],
              TileMode.repeated,
              3 * pi / 2,
              7 * pi / 2)
          : null
      ..strokeWidth = stroke ?? 4
      ..strokeCap = StrokeCap.round
      ..style = style ?? PaintingStyle.stroke;
    var rect = const Offset(0.0, 0.0) & size;
    canvas.drawArc(
        rect, -pi * 0.5, pi * 2.0 * staticFraction!, false, _staticPaint);
    canvas.drawArc(rect, -pi * 0.5, pi * 2.0 * fraction!, false, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
