import 'package:flutter/material.dart';

class SheikaImage extends StatefulWidget {
  const SheikaImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Image image;

  @override
  State<SheikaImage> createState() => _SheikaImageState();
}

class _SheikaImageState extends State<SheikaImage> {
  @override
  Widget build(BuildContext context) {
    return widget.image;
  }
}
