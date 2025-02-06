import 'package:flutter/material.dart';
import 'package:todo/widget/AddButtonWidget.dart';
import 'package:todo/widget/InputWidget.dart';
import 'package:todo/widget/listWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List toDoList = <String>[];
  TextEditingController controller = TextEditingController();
  String warning = "";
  bool isANewTask = true;
  int taskIndex = 0;
  Icon buttonIcon = Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ListWidget(
              toDoList: toDoList,
              deleteTask: deleteTask,
              editTask: editTask,
            ),
            InputWidget(controller: controller),
          ],
        ),
      ),
      floatingActionButton: AddButtonWidget(
        addUser: addTask,
        icon: buttonIcon,
      ),
    );
  }

  void addTask() {
    String newTask = controller.text;

    if (newTask == "") {
      warning = "Campo não preenchido!";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(warning),
      ));
      setState(() {});
      return;
    }

    if (isANewTask == true) {
      for (var task in toDoList) {
        if (task == newTask) {
          warning = "Esta tarefa já está cadastrada!";
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(warning),
          ));
          setState(() {});
          return;
        }
      }
      toDoList.add(newTask);
    } else {
      toDoList[taskIndex] = newTask;
      isANewTask = true;
      buttonIcon = Icon(Icons.add);
    }
    controller = TextEditingController();
    setState(() {});
  }

  void deleteTask(task) {
    toDoList.removeAt(task);
    setState(() {});
  }

  void editTask(task) {
    taskIndex = task;
    isANewTask = false;
    controller = TextEditingController(text: toDoList[task]);
    buttonIcon = Icon(Icons.check);
    setState(() {});
  }
}
