import 'package:bpl/heading.dart';
import 'package:bpl/second_screen/add_toto.dart';
import 'package:bpl/second_screen/todo.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return AddTodo(
                onTaskAdded: (task) {
                  setState(() {
                    todos.add(task);
                  });
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          color: Constants.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(32),
                child: Heading("TODO"),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      topRight: Radius.circular(42),
                    ),
                  ),
                  child: Todo(todos: todos),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
