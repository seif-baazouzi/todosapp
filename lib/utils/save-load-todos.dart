import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todosapp/Models/todo.dart';

const _todosKey = "todos-list";

void saveTodos(List<Todo> todos) async {
  final pref = await SharedPreferences.getInstance();
  String todosString = "";

  for (int i = 0; i < todos.length; i++) {
    todosString += todos[i].toJson();
    if (i != todos.length - 1) todosString += "\n";
  }

  await pref.setString(_todosKey, todosString);
}

Future<List<Todo>> loadTodos() async {
  final pref = await SharedPreferences.getInstance();
  final todosList = pref.getString(_todosKey) ?? "";
  List<Todo> todos = [];

  todosList.split("\n").forEach((todoString) {
    todos.add(Todo.fromJson(todoString));
  });

  return todos;
}
