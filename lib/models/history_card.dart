import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.history, {super.key});

  final Map history;

  @override
  Widget build(BuildContext context) {
    String title = history['name'];
    String volum = history['volum'];
    String datetime = history['datetime'];
    String preco = history['price'];

    return Card.outlined(
        surfaceTintColor: Colors.red,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
            height: 100,
            child: Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: ListTile(
                trailing: Icon(
                  Icons.attach_money_sharp,
                  size: 35,
                ),
                title: Text('$title - $volum ml'),
                titleAlignment: ListTileTitleAlignment.center,
                subtitle: Text(
                  '$datetime\nR\$ $preco',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 194, 47, 47)),
                ),
                iconColor: Colors.blue,
              ),
            ))));
  }
}
