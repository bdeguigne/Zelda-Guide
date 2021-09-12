import 'package:bpl/heading.dart';
import 'package:bpl/second_screen/second_screen.dart';
import 'package:flutter/material.dart';

import 'button_label.dart';
import 'constants.dart';
import 'localisation.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _showMainLogo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.backgroundColor,
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
                const Heading("Sheika Slate"),
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
                const SizedBox(
                  height: 32,
                ),
                InkWell(
                  child: const Localisation(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
