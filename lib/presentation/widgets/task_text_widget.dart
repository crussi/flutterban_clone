import 'package:flutter/material.dart';

class TaskText extends StatelessWidget {
  const TaskText({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          //height: 75,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
      Text(
        description,
        style: const TextStyle(
          fontSize: 15,
          //height: 75,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      )
    ]);
  }
}
