import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/custom_painter/painter_utils.dart';

class SheikaBoxPainter extends CustomPainter {
  SheikaBoxPainter({
    this.glow = false,
    required this.color,
    required this.opacity,
    this.showCorners = false,
  });

  final bool glow;
  final Color color;
  final double opacity;
  final bool showCorners;

  @override
  void paint(Canvas canvas, Size size) {
    if (glow == true) {
      drawGlow(canvas, size, opacity);
    }
    drawStrokeRect(
      canvas,
      size,
      glow ? Colors.white.withOpacity(opacity) : color,
    );
    if (showCorners) {
      final paint = Paint()..color = color;
      drawBottomRightTriangle(canvas, size, 6, 17, paint, glow);
      drawUpperRightTriangle(canvas, size, 6, 17, paint, glow);
      drawUpperLeftTriangle(canvas, size, 6, 17, paint, glow);
      drawBottomLeftTriangle(canvas, size, 6, 17, paint, glow);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SheikaHoverSelectionPainter extends CustomPainter {
  SheikaHoverSelectionPainter({
    required this.offset,
    this.glow = false,
  });

  final bool glow;
  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = glow ? Colors.white : const Color(0xff607982);

    double triangleSize = 15 + offset;

    drawBottomRightTriangle(canvas, size, offset, triangleSize, paint, glow);
    drawUpperRightTriangle(canvas, size, offset, triangleSize, paint, glow);
    drawUpperLeftTriangle(canvas, size, offset, triangleSize, paint, glow);
    drawBottomLeftTriangle(canvas, size, offset, triangleSize, paint, glow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
