import 'package:flutter/material.dart';

class Point {
  List<Offset> offsets;

  Point({this.offsets = const []});

  Point copyWith({List<Offset>? offsets}) {
    return Point(
      offsets: offsets ?? this.offsets,
    );
  }
}