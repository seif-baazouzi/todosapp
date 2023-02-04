import 'package:flutter/material.dart';
import 'package:todosapp/Models/todo.dart';
import 'package:todosapp/Widgets/add-todo.dart';
import 'package:todosapp/Widgets/empty-list.dart';
import 'package:todosapp/Widgets/todos-list.dart';
import 'package:todosapp/Widgets/todos-status.dart';
import 'package:todosapp/utils/save-load-todos.dart';

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
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _setTodos();
  }

  _setTodos() async {
    todos = await loadTodos();
    setState(() => todos = todos);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getBodyContent(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTodoPopup,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> getBodyContent() {
    return todos.isNotEmpty
        ? <Widget>[
            TodosStatus(todos: todos),
            TodosList(
              todos: todos,
              toggleTodoDone: _toggleTodoDone,
              deleteTodo: _deleteTodo,
            ),
          ]
        : [const EmptyList()];
  }

  void showAddTodoPopup() {
    showDialog(context: context, builder: (ctx) => AddTodo(addTodo: _addTodo));
  }

  void _addTodo(String todo) {
    setState(() {
      todo = todo.trim();
      if (todo != "") todos.add(Todo(todo: todo, done: false));
    });
    saveTodos(todos);
  }

  void _toggleTodoDone(index) {
    setState(() {
      todos[index].done = !todos[index].done;
    });
    saveTodos(todos);
  }

  void _deleteTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
    saveTodos(todos);
  }
}
