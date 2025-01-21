import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.history, {super.key});

  final Map history;

  @override
  Widget build(BuildContext context) {
    String title = history['productName'];
    Timestamp datetime = history['purchaseDateTime'];
    double preco = history['productPrice'];

    return Card.outlined(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: const Color.fromARGB(255, 172, 43, 34),
              width: 2.0,
            )),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: ListTile(
                trailing: Icon(
                  Icons.attach_money_sharp,
                  size: 35,
                ),
                title: Text(title),
                titleAlignment: ListTileTitleAlignment.center,
                subtitle: Text(
                  '$datetime\nR\$ $preco',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 194, 47, 47)),
                ),
                iconColor: Colors.blue,
              ),
            )));
  }
}
