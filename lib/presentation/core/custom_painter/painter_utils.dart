import 'package:flutter/material.dart';

void drawStrokeRect(
  Canvas canvas,
  Size size,
  Color color,
) {
  const shadowOffset = 6.0;

  final paint = Paint()
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..color = color;
  canvas.drawRect(
    Rect.fromPoints(
      const Offset(shadowOffset, shadowOffset),
      Offset(size.width - shadowOffset, size.height - shadowOffset),
    ),
    paint,
  );
}

void drawGlow(Canvas canvas, Size size, double opacity) {
  Path path = Path();
  const elevation = 3.0;

  path.addRect(Rect.fromPoints(
    const Offset(0, -elevation),
    Offset(size.width, size.height - elevation),
  ));
  path.close();

  canvas.drawShadow(
    path,
    Colors.white.withOpacity(opacity),
    elevation,
    false,
  );
}

void drawBottomRightTriangle(
  Canvas canvas,
  Size size,
  double offset,
  double triangleSize,
  Paint paint,
  bool showShadow,
) {
  if (showShadow) {
    var shadowPath = Path();
    shadowPath.moveTo(size.width, size.width - triangleSize);
    shadowPath.lineTo(size.height - triangleSize, size.height);
    shadowPath.lineTo(size.height, size.width);
    shadowPath.close();

    canvas.drawShadow(
      shadowPath,
      Colors.blueAccent,
      8,
      false,
    );
  }

  var path = Path();
  path.moveTo(size.width - offset, size.width - triangleSize);
  path.lineTo(size.height - triangleSize, size.height - offset);
  path.lineTo(size.height - offset, size.width - offset);
  path.close();

  canvas.drawPath(path, paint);
}

void drawUpperRightTriangle(
  Canvas canvas,
  Size size,
  double offset,
  double triangleSize,
  Paint paint,
  bool showShadow,
) {
  if (showShadow) {
    var shadowPath = Path();
    shadowPath.moveTo(size.width, 0);
    shadowPath.lineTo(size.height - triangleSize, 0);
    shadowPath.lineTo(size.height, triangleSize);
    shadowPath.close();

    canvas.drawShadow(
      shadowPath,
      Colors.blueAccent,
      8,
      false,
    );
  }

  var path = Path();
  path.moveTo(size.width - offset, 0 + offset);
  path.lineTo(size.height - triangleSize, 0 + offset);
  path.lineTo(size.height - offset, triangleSize);
  path.close();

  canvas.drawPath(path, paint);
}

void drawUpperLeftTriangle(
  Canvas canvas,
  Size size,
  double offset,
  double triangleSize,
  Paint paint,
  bool showShadow,
) {
  if (showShadow) {
    var shadowPath = Path();
    shadowPath.moveTo(0, triangleSize);
    shadowPath.lineTo(0, 0);
    shadowPath.lineTo(triangleSize, 0);
    shadowPath.close();

    canvas.drawShadow(
      shadowPath,
      Colors.blueAccent,
      8,
      false,
    );
  }

  var path = Path();

  path.moveTo(0 + offset, triangleSize);
  path.lineTo(0 + offset, 0 + offset);
  path.lineTo(triangleSize, 0 + offset);
  path.close();

  canvas.drawPath(path, paint);
}

void drawBottomLeftTriangle(
  Canvas canvas,
  Size size,
  double offset,
  double triangleSize,
  Paint paint,
  bool showShadow,
) {
  if (showShadow) {
    var shadowPath = Path();
    shadowPath.moveTo(0, size.height - triangleSize);
    shadowPath.lineTo(0, size.height);
    shadowPath.lineTo(triangleSize, size.width);
    shadowPath.close();

    canvas.drawShadow(
      shadowPath,
      Colors.blueAccent,
      8,
      false,
    );
  }
  var path = Path();

  path.moveTo(0 + offset, size.height - triangleSize);
  path.lineTo(0 + offset, size.height - offset);
  path.lineTo(triangleSize, size.width - offset);
  path.close();

  canvas.drawPath(path, paint);
}
