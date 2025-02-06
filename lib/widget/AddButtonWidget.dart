import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final Function() addUser;
  final Icon icon;
  const AddButtonWidget({super.key, required this.addUser, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: addUser, child: icon);
  }
}
