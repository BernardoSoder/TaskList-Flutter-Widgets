import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final List toDoList;
  const ListWidget({super.key, required this.toDoList});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(Icons.delete),
                trailing: Icon(Icons.person),
                title: Text(toDoList[index],),
              ); 
          },),
      );
  }
}