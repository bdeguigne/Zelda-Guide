import 'package:flutter/material.dart';

class HyruleItem extends StatelessWidget {
  const HyruleItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
    );
  }
}
