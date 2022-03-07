import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Arabada beş evde onbeş",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Pazara git",
      description: """- 2 kilo patetes,
    - 1 kilo soğan
    - 1 kilo sarımsak
     """,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Pazara git",
      description: """- 2 kilo patetes,
    - 1 kilo soğan
    - 1 kilo sarımsak
     """,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Arabada beş evde onbeş",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Pazara git",
      description: """- 2 kilo patetes,
    - 1 kilo soğan
    - 1 kilo sarımsak
     """,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Pazara git",
      description: """- 2 kilo patetes,
    - 1 kilo soğan
    - 1 kilo sarımsak
     """,
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool todoIsDone(Todo todo) {
    todo.isDone = !todo.isDone;
    return todo.isDone;
  }
}
