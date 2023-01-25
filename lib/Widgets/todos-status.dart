import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';
import 'package:todosapp/lang.dart';

class TodosStatus extends StatelessWidget {
  final List<Todo> todos;
  int _doneTodos = 0;

  TodosStatus({super.key, required this.todos}) {
    _doneTodos = 0;
    for (var todo in todos) {
      if (todo.done) _doneTodos++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_doneTodos/${todos.length}",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 72,
        color: _doneTodos == todos.length ? Colors.green : Colors.black,
      ),
    );
  }
}
