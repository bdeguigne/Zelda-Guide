import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/custom_painter/sheika_box_painter.dart';

class HyruleItem extends StatefulWidget {
  const HyruleItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  State<HyruleItem> createState() => _HyruleItemState();
}

class _HyruleItemState extends State<HyruleItem> {
  @override
  Widget build(BuildContext context) {
    return SheikaBox(
      child: Image(
        image: NetworkImage(widget.imageUrl),
      ),
    );
  }
}

class SheikaBox extends StatefulWidget {
  const SheikaBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _SheikaBoxState createState() => _SheikaBoxState();
}

class _SheikaBoxState extends State<SheikaBox> {
  var _glow = false;

  @override
  Widget build(BuildContext context) {
    return SheikaHover(
      child: CustomPaint(
        foregroundPainter: SheikaBoxPainter(
          glow: _glow,
          color: const Color(0xff607982),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CustomPaint(
            foregroundPainter: SheikaBoxPainter(
              glow: _glow,
              color: const Color(0xff39515D),
            ),
            child: InkWell(
              onTap: () => setState(() {
                _glow = !_glow;
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SheikaHover extends StatefulWidget {
  const SheikaHover({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _SheikaHoverState createState() => _SheikaHoverState();
}

class _SheikaHoverState extends State<SheikaHover>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 350),
    vsync: this,
  )..repeat(reverse: true);

  late Animation<double> _animation;
  double _offset = 6;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 8.0, end: -6.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _offset = _animation.value;
        });
      });
    return CustomPaint(
      foregroundPainter: SheikaHoverSelectionPainter(
        offset: _offset,
        glow: true,
      ),
      child: widget.child,
    );
  }
}
