import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog(this.reason, {super.key});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 8.0,
      icon: Icon(Icons.warning_rounded, size: 30),
      iconColor: Colors.red,
      clipBehavior: Clip.antiAlias,
      scrollable: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: const Color.fromARGB(255, 172, 43, 34),
            width: 4.0,
          )),
      title: Text(
        'Dados inválidos',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      content: Text(
        reason,
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    );
  }
}
