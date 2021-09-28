import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/custom_painter/sheika_box_painter.dart';

class SheikaAnimatedBox extends StatefulWidget {
  const SheikaAnimatedBox({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  SheikaAnimatedBoxState createState() => SheikaAnimatedBoxState();
}

class SheikaAnimatedBoxState extends State<SheikaAnimatedBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late Animation<double> _animationOpacity;
  late Animation<Color?> _animationColor;
  double _opacity = 0.5;
  Color? _color = const Color(0xff607982);
  bool _glow = false;

  @override
  void initState() {
    _color = widget.color;
    super.initState();
  }

  void forward() {
    _controller.forward();
    setState(() {
      _glow = true;
    });
  }

  void reverse() {
    _controller.reverse();
    setState(() {
      _glow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _animationOpacity = Tween(begin: 0.5, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _opacity = _animationOpacity.value;
        });
      });
    _animationColor =
        ColorTween(begin: widget.color, end: Colors.white).animate(_controller)
          ..addListener(() {
            setState(() {
              _color = _animationColor.value;
            });
          });
    return CustomPaint(
      foregroundPainter: SheikaBoxPainter(
        opacity: _opacity,
        glow: _glow,
        color: _color!,
      ),
      child: widget.child,
    );
  }
}
