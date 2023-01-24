import 'package:flutter/material.dart';

import 'package:todosapp/lang.dart' as lang;

class AddTodo extends StatefulWidget {
  final Function(String) addTodo;

  const AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsetsDirectional.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  maxLength: 120,
                  autofocus: true,
                  textAlign: TextAlign.right,
                  controller: _todoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(lang.todo),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => addTodoCallback(context),
                child: const Text(lang.addTodo),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTodoCallback(context) {
    widget.addTodo(_todoController.text);
    Navigator.pop(context);
  }
}
