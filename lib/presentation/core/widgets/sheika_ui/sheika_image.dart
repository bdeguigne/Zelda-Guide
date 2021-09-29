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
  bool _finishedLoading = false;

  @override
  void initState() {
    widget.image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool syncCall) {
          setState(() {
            _finishedLoading = true;
          });
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: _finishedLoading
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 350),
      firstChild: const Image(
        image: AssetImage("assets/images/sheika-placeholder.png"),
      ),
      secondChild: widget.image,
    );
  }
}
