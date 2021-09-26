import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/bg.jpg",
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
