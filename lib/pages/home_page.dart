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
            ListWidget(toDoList: toDoList),
            InputWidget(controller: controller),
          ],) , 
      ), 
      floatingActionButton: AddButtonWidget(adicionarUsuario: adicionarUsuario),
    );
    
  }

  void adicionarUsuario(){
    String novaTarefa = controller.text;
    for (var tarefa in toDoList) {
      if (tarefa == novaTarefa){  
        warning = "Esta tarefa já está cadastrada!";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(warning),));
        setState(() {});
        return;
      }
    }
    toDoList.add(novaTarefa);
    setState(() {});
  }
}