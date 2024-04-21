import 'package:flutter/material.dart';
import 'package:content/services/point.dart';

class Painter extends CustomPainter {
  final List<Point> curve;

  Painter({required this.curve});

  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint();
    background.color = Colors.white;
    Rect rect = Rect.largest;
    canvas.drawRect(rect, background);

    final paint = Paint();
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.color = Colors.black;
    paint.strokeWidth = 5.0;

    for (Point i in curve){
      for (int j = 0; j < i.offsets.length; j++) {
        var lastOffset = j == i.offsets.length - 1;

        if (lastOffset) {
          // Do not draw
        }
        else {
          final start = i.offsets[j];
          final end = i.offsets[j+1];
          canvas.drawLine(start, end, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}