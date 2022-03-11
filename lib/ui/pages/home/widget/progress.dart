import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int? min;

  const ProgressBar({Key? key, this.min}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      color: Colors.red,
      width: min! / 60 * 100,
    );
  }
}
