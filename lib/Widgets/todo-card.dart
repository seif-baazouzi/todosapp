import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final int index;
  final Function(int) toggleTodoDone;

  const TodoCard(
      {super.key,
      required this.todo,
      required this.index,
      required this.toggleTodoDone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleTodoDone(index),
      child: Card(
        child: Container(
          padding: const EdgeInsetsDirectional.all(20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  todo.todo,
                  style: TextStyle(
                    decoration: todo.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
