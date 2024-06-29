import 'package:flutter/material.dart';

class TouchPoints {
  Paint paint;
  Offset points;
  TouchPoints({required this.paint, required this.points});

  Map<String, dynamic> toJson() {
    return {
      'point': {'dx': '${points.dx}', 'dy': '${points.dy}'}
    };
  }
}
