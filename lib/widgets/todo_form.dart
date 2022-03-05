import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged onChangedTitle;
  final ValueChanged onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget({
    Key? key,
    this.title = "",
    this.description = "",
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(),
          buildDescription(),
          SizedBox(height: 30),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(black),
        ),
        onPressed: onSavedTodo,
        child: Text(
          "Save",
          style: barTextStyle,
        ),
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Description",
      ),
    );
  }

  Widget buildTitle() {
    return TextFormField(
      maxLines: 1,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Title",
      ),
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) {
        if (title!.isEmpty) {
          return "The title cannot be empty";
        }
        return null;
      },
    );
  }
}
