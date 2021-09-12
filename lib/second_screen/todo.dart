import 'package:bpl/second_screen/checkbox.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key, required this.todos}) : super(key: key);

  final List<String> todos;

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: widget.todos
            .map(
              (todo) => InkWell(
                onLongPress: () {
                  setState(() {
                    widget.todos.remove(todo);
                  });
                },
                child: CustomCheckbox(title: todo),
              ),
            )
            .toList(),
      ),
    );
  }
}
