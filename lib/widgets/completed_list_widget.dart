import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provide/todos.dart';
import 'package:todo_app/widgets/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? Text("No completed tasks.")
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            itemCount: todos.length,
            separatorBuilder: (context, index) => Container(
              height: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
