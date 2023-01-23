import 'package:flutter/material.dart';

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _todoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Todo"),
                ),
              ),
              TextButton(
                onPressed: () => addTodoCallback(context),
                child: const Text("Add Todo"),
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
