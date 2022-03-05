import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/add_todo_dialog.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Todo App",
          style: barTextStyle,
        ),
      ),
      body: tabs[selectedIndex],
      floatingActionButton: floatingActionButtonn(),
      bottomNavigationBar: bottomNavigationBarr(context),
    );
  }

  FloatingActionButton floatingActionButtonn() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddTodoDialogWidget();
          },
        );
      },
    );
  }

  BottomNavigationBar bottomNavigationBarr(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined),
          label: "Todos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined),
          label: "Completed",
        ),
      ],
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
