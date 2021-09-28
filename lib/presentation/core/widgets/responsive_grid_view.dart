import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

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
          crossAxisCount: _breakpoint.columns,
        ),
        itemCount: children.length,
        itemBuilder: (_, index) {
          return children.elementAt(index);
        },
      );
    });
  }
}
