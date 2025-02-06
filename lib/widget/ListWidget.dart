import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final List toDoList;
  final Function(int index) deleteTask;
  final Function(int index) editTask;
  const ListWidget(
      {super.key,
      required this.toDoList,
      required this.deleteTask,
      required this.editTask});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, task) {
          return ListTile(
            leading: InkWell(
                onTap: () => deleteTask(task), child: Icon(Icons.delete)),
            trailing:
                InkWell(onTap: () => editTask(task), child: Icon(Icons.edit)),
            title: Text(
              toDoList[task],
            ),
          );
        },
      ),
    );
  }
}
