import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';
import 'package:todosapp/Widgets/todo-card.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int) toggleTodoDone;
  final Function(int) deleteTodo;

  const TodosList({
    super.key,
    required this.todos,
    required this.toggleTodoDone,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < todos.length; i++)
              TodoCard(
                todo: todos[i],
                index: i,
                toggleTodoDone: toggleTodoDone,
                deleteTodo: deleteTodo,
              )
          ],
        ),
      ),
    );
  }
}
