import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_animated_box.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_hover.dart';

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

class _SheikaBoxState extends State<SheikaBox>
    with SingleTickerProviderStateMixin {
  final sheikaOuterBoxKey = GlobalKey<SheikaAnimatedBoxState>();
  final sheikaInnerBoxKey = GlobalKey<SheikaAnimatedBoxState>();

  @override
  Widget build(BuildContext context) {
    return SheikaHover(
      onEnter: () {
        if (sheikaOuterBoxKey.currentState != null &&
            sheikaInnerBoxKey.currentState != null) {
          sheikaOuterBoxKey.currentState!.forward();
          sheikaInnerBoxKey.currentState!.forward();
        }
      },
      onExit: () {
        if (sheikaOuterBoxKey.currentState != null &&
            sheikaInnerBoxKey.currentState != null) {
          sheikaOuterBoxKey.currentState!.reverse();
          sheikaInnerBoxKey.currentState!.reverse();
        }
      },
      child: SheikaAnimatedBox(
        key: sheikaOuterBoxKey,
        color: const Color(0xff607982),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SheikaAnimatedBox(
            key: sheikaInnerBoxKey,
            color: const Color(0xff3E535E),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
