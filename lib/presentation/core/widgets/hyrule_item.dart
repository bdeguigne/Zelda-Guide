import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/sheika_box.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/sheika_image.dart';

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
      child: SheikaImage(
        image: Image(
          image: NetworkImage(widget.imageUrl),
        ),
      ),
    );
  }
}
