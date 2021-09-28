import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/custom_painter/sheika_box_painter.dart';

class SheikaHover extends StatefulWidget {
  const SheikaHover({
    Key? key,
    required this.child,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  final Widget child;
  final Function? onEnter;
  final Function? onExit;

  @override
  _SheikaHoverState createState() => _SheikaHoverState();
}

class _SheikaHoverState extends State<SheikaHover>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 350),
    vsync: this,
  );
  final double begin = -6.0;
  final double end = 8.0;
  late Animation<double> _animation;
  double _offset = 6;
  bool _playAnimation = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    if (_playAnimation) {
      _controller.repeat(reverse: true);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: begin, end: end).animate(_controller)
      ..addListener(() {
        setState(() {
          _offset = _animation.value;
        });
      });
    return MouseRegion(
      onEnter: (event) => setState(() {
        _controller.repeat(reverse: true);
        _playAnimation = true;
        if (widget.onEnter != null) {
          widget.onEnter!();
        }
      }),
      onExit: (event) => setState(() {
        _controller.stop();
        setState(() {
          _offset = begin;
        });
        _playAnimation = false;
        if (widget.onExit != null) {
          widget.onExit!();
        }
      }),
      child: CustomPaint(
        foregroundPainter: _playAnimation
            ? SheikaHoverSelectionPainter(
                offset: _offset,
                glow: true,
              )
            : null,
        child: widget.child,
      ),
    );
  }
}
