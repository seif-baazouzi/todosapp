import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';
import 'package:todosapp/Widgets/add-todo.dart';
import 'package:todosapp/Widgets/todos-list.dart';
import 'package:todosapp/Widgets/todos-status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [
    Todo(todo: "First Todo", done: true),
    Todo(todo: "Other todo", done: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TodosStatus(todos: todos),
              TodosList(
                todos: todos,
                toggleTodoDone: _toggleTodoDone,
                deleteTodo: _deleteTodo,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTodoPopup,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void showAddTodoPopup() {
    showDialog(context: context, builder: (ctx) => AddTodo(addTodo: _addTodo));
  }

  void _addTodo(String todo) {
    setState(() {
      todo = todo.trim();
      if (todo != "") todos.add(Todo(todo: todo, done: false));
    });
  }

  void _toggleTodoDone(index) {
    setState(() {
      todos[index].done = !todos[index].done;
    });
  }

  void _deleteTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
