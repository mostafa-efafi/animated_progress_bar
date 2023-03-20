import 'package:animated_progress_bar/src/paints/circle_shape.dart';
import 'package:flutter/material.dart';

class View extends StatelessWidget {
  final double fraction;
  final double staticFraction;
  final double? stroke;
  final Color? color;
  final PaintingStyle? style;
  const View(
      {Key? key,
      required this.fraction,
      required this.staticFraction,
      this.stroke,
      this.style,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: CircleShape(
                    color: color,
                    stroke: stroke ?? 10,
                    style: style ?? PaintingStyle.stroke,
                    fraction: fraction,
                    staticFraction: staticFraction),
                child: Expanded(child: Container()),
              ),
              Text(
                '%${(fraction * 100).toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 97, 94, 94),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
