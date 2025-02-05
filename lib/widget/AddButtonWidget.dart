import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final Function() adicionarUsuario;
  const AddButtonWidget({super.key, required this.adicionarUsuario});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: adicionarUsuario,
      child: Icon(Icons.add), 
    );
  }
}