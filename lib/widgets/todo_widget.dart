import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provide/todos.dart';
import 'package:todo_app/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return todoBox(context);
  }

  Widget todoBox(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Slidable(
        key: Key(todo.id),
        child: buildTodo(context),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.green,
              onPressed: (_) => completeTodo(context, todo),
              label: "Edit",
              icon: Icons.edit,
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              onPressed: (_) => deleteTodo(context, todo),
              label: "Delete",
              icon: Icons.delete,
            )
          ],
        ),
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: white,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: white,
            value: todo.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20),
                ),
                if (todo.description.isNotEmpty) Text(todo.description),
              ],
            ),
          )
        ],
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.deleteTodo(todo);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    Utils.showSnackBar(context, "Deleted the task");
  }

  void completeTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final isDone = provider.todoIsDone(todo);

    Utils.showSnackBar(
        context, isDone ? "Text completed." : "Task marked incompleted.");
  }
}
