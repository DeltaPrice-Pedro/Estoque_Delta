import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 8.0,
      icon: Icon(Icons.attach_money_sharp, size: 30),
      iconColor: Colors.blue,
      clipBehavior: Clip.antiAlias,
      scrollable: true,
      title: Text(
        'Solicitar pedido',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      content: Column(
        children: [
          Text(
            'Confirmar a compra do produto a baixo?',
            style: TextStyle(fontSize: 15),
          ),
          Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                      height: 100,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1.0,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 12.5, 2.0, 0.0),
                              child: ListTile(
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                            ))
                          ]))))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
        TextButton(onPressed: () {}, child: Text('Confirmar')),
      ],
    );
  }
}
