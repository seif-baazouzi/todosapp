import 'dart:convert';

class Todo {
  String todo = "";
  bool done = false;

  Todo({
    required this.todo,
    required this.done,
  });

  String toJson() {
    return '{"todo": "$todo", "done": $done}';
  }

  static Todo fromJson(String jsonString) {
    final result = json.decode(jsonString);
    return Todo(
      todo: result["todo"] ?? "",
      done: result["done"] ?? false,
    );
  }
}
