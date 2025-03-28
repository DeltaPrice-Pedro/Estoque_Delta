import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy, HH:mm');

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.history, {super.key});

  final Map history;

  @override
  Widget build(BuildContext context) {
    String title = history['productName'];
    String datetime =
        formatter.format((history['purchaseDateTime'] as Timestamp).toDate());
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
                title: Text(title),
                titleAlignment: ListTileTitleAlignment.center,
                subtitle: Text(
                  '$datetime\nR\$ $preco',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 194, 47, 47)),
                ),
              ),
            )));
  }
}
