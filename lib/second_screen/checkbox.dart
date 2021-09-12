import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: TextStyle(
            decoration: _isChecked ? TextDecoration.lineThrough : null),
      ),
      value: _isChecked,
      onChanged: (_) {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }
}
