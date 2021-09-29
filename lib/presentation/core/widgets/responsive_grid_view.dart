import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  int getResponsiveColumns(Breakpoint breakpoint) {
    switch (breakpoint.window) {
      case WindowSize.xsmall:
        return 3;
      case WindowSize.small:
        return 4;
      case WindowSize.medium:
        return 6;
      case WindowSize.large:
        return 12;
      case WindowSize.xlarge:
        return 12;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final _breakpoint = Breakpoint.fromConstraints(constraints);
      return GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: _breakpoint.gutters,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getResponsiveColumns(_breakpoint),
        ),
        itemCount: children.length,
        itemBuilder: (_, index) {
          return children.elementAt(index);
        },
      );
    });
  }
}
