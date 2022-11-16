
import 'package:flutter/material.dart';

class Difficulty extends StatefulWidget {
  const Difficulty({Key? key, required this.difficulty}) : super(key: key);

  final int difficulty;
  @override
  State<Difficulty> createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: (widget.difficulty >= 1) ? const Color.fromRGBO(36, 3, 252, 1): Colors.blue[100]),
        Icon(Icons.star, color: (widget.difficulty >= 2) ? const Color.fromRGBO(36, 3, 252, 1): Colors.blue[100]),
        Icon(Icons.star, color: (widget.difficulty >= 3) ? const Color.fromRGBO(36, 3, 252, 1): Colors.blue[100]),
        Icon(Icons.star, color: (widget.difficulty >= 4) ? const Color.fromRGBO(36, 3, 252, 1): Colors.blue[100]),
        Icon(Icons.star, color: (widget.difficulty >= 5) ? const Color.fromRGBO(36, 3, 252, 1): Colors.blue[100]),
      ],
    );
  }
}
