import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final int index;
  final Function(int) toggleTodoDone;
  final Function(int) deleteTodo;

  const TodoCard({
    super.key,
    required this.todo,
    required this.index,
    required this.toggleTodoDone,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleTodoDone(index),
      child: Card(
        child: Container(
          padding: const EdgeInsetsDirectional.all(20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    todo.todo,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: todo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  IconButton(
                    onPressed: () => deleteTodo(index),
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
