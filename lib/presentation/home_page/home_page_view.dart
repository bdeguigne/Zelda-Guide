import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:get/get.dart';
import '../core/widgets/button_label.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 250,
                image: AssetImage(
                  "assets/images/sheika.png",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "SHEIKA GUIDE",
                style: TextStyle(
                  fontFamily: "Zelda",
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "This is where your adventure begins...",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Divider(
                  height: 60,
                  color: Colors.blue[100],
                ),
              ),
              ButtonLabel(
                onPressed: () => Get.toNamed("/register"),
                label: "Explore Hyrule",
                icon: const Icon(
                  Icons.explore_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
