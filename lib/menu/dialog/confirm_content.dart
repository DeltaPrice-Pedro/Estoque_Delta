import 'package:flutter/material.dart';

class ConfirmContent extends StatelessWidget {
  const ConfirmContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Compra do produto CONFIRMADA',
        style: TextStyle(fontSize: 15),
      ),
      Icon(
        Icons.check_circle,
        size: 100.0,
        color: Colors.blueAccent,
      ),
      Text(
        'Em caso de engano,\nconsulte a equipe responsável',
        textAlign: TextAlign.center,
      )
    ]);
  }
}
