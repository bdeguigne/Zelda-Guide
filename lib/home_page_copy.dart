import 'package:flutter/material.dart';

import 'button_label.dart';

import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyHomePageController controller = Get.put(MyHomePageController());

  bool _showMainLogo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff001833),
        child: Padding(
          padding: const EdgeInsets.all(42.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    _showMainLogo = !_showMainLogo;
                  }),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/${_showMainLogo ? 'sheika.png' : 'zelda.png'}",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "SHEIKA SLATE",
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
                const ButtonLabel(
                  label: "Explore Hyrule",
                  icon: Icon(
                    Icons.explore_outlined,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const ButtonLabel(
                  label: "Disconnect",
                  icon: Icon(
                    Icons.logout_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
