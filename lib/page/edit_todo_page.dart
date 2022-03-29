import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provide/todos.dart';
import 'package:todo_app/widgets/todo_form.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title = "";
  String description = "";
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.deleteTodo(widget.todo);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete,
                color: white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: TodoFormWidget(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() {
              this.title = title;
            }),
            onChangedDescription: (description) => setState(() {
              this.description = description;
            }),
            onSavedTodo: () => saveTodo(),
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final _isValid = _key.currentState!.validate();
    if (!_isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);
      Navigator.pop(context);
    }
  }
}
