import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsetsDirectional.all(20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(todo.todo),
              todo.done
                  ? const Icon(Icons.done, color: Colors.green)
                  : const Icon(Icons.close, color: Colors.red)
            ]),
      ),
    );
  }
}
