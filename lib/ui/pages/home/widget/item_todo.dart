import 'package:flutter/material.dart';

class ItemTodo extends StatelessWidget {
  const ItemTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white, width: 1),
      ),
    );
  }
}
