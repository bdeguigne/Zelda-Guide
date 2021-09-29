import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  final Widget body;
  final Widget? bottomNavigationBar;

  String getBackgroundByScreenSize(WindowSize window) {
    switch (window) {
      case WindowSize.xsmall:
        return "assets/images/background/bg-small.jpg";
      case WindowSize.small:
        return "assets/images/background/bg-small.jpg";
      case WindowSize.medium:
        return "assets/images/background/bg-small.jpg";
      case WindowSize.large:
        return "assets/images/background/bg-large.jpg";
      case WindowSize.xlarge:
        return "assets/images/background/bg-large.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final _breakpoint = Breakpoint.fromConstraints(constraints);
        return Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Expanded(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      getBackgroundByScreenSize(_breakpoint.window),
                    ),
                  ),
                ),
              ),
              body,
            ],
          ),
        );
      },
    );
  }
}
