import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(todo.id),
      child: buildTodo(context),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.green,
            onPressed: (_) {},
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
            onPressed: (_) {},
            label: "Delete",
            icon: Icons.delete,
          )
        ],
      ),
    );
  }

  Container buildTodo(BuildContext context) {
    return Container(
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
          Column(
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (todo.description.isNotEmpty) Text(todo.description),
            ],
          )
        ],
      ),
    );
  }
}
