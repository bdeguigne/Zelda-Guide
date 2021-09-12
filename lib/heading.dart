import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontFamily: "Zelda",
        fontSize: 45,
        color: Colors.white,
      ),
    );
  }
}
