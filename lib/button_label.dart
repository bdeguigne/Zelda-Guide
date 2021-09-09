import 'package:flutter/material.dart';

class ButtonLabel extends StatelessWidget {
  const ButtonLabel({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        icon: icon,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 1.0,
            color: Colors.blue,
          ),
        ),
        onPressed: () => {},
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
