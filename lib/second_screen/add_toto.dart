import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key, this.onTaskAdded}) : super(key: key);

  final Function(String task)? onTaskAdded;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  late String _input;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Add todos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a task...',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (value) => setState(() {
                _input = value;
              }),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.onTaskAdded != null) {
                    widget.onTaskAdded!(_input);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  child: Text('Add'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
