import 'package:estoque_delta/menu/dialog/query_content.dart';
import 'package:estoque_delta/menu/dialog/confirm_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog(this.infos, this.docID, {super.key});

  final Map infos;
  final String docID;

  @override
  State<ProductDialog> createState() {
    return _Product(infos, docID);
  }
}

class _Product extends State<ProductDialog> {
  _Product(this.infos, this.docID);

  final Map infos;
  final String docID;
  Widget? activateContent;
  List<Widget>? actions;

  @override
  void initState() {
    activateContent = QueryContent(infos);
    actions = [
      TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
          child: Text(
            'Fechar',
            style: TextStyle(color: Colors.black),
          )),
      TextButton(
          onPressed: _submit,
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          child: Text(
            'Confirmar',
            style: TextStyle(color: Colors.black),
          )),
    ];
    super.initState();
  }

  void _submit() async {
    final user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('history').add({
      'userUid': user.uid,
      'productName': infos['title'],
      'productPrice': infos['price'],
      'purchaseDateTime': DateTime.now()
    });

    await FirebaseFirestore.instance
        .collection('products')
        .doc(docID)
        .update({'amount': (infos['amount'] - 1)});

    var currentTotal;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot doc) {
      currentTotal = doc.data();
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'totalSpent': (currentTotal['totalSpent'] + infos['price'])});

    setState(() {
      activateContent = const ConfirmContent();
      actions!.removeAt(1);
    });
  }

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
      content: activateContent,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: actions,
    );
  }
}
