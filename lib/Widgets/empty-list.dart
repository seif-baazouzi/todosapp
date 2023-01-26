import 'package:flutter/material.dart';
import 'package:todosapp/lang.dart' as lang;

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(Icons.checklist_rtl_rounded, size: 150),
        Text(
          lang.noTodosYet,
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
