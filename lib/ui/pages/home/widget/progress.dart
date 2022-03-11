import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int? min;

  const ProgressBar({Key? key, this.min}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.white30,
              border: Border.all(color: Colors.white,width: 1)
          ),
          width: min! / 60 * 300,
        )
      ],
    );
  }
}
