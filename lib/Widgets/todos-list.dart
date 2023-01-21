import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';
import 'package:todosapp/Widgets/todo-card.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  const TodosList({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[...todos.map((todo) => TodoCard(todo: todo))],
      ),
    );
  }
}
