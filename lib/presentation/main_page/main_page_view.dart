import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
