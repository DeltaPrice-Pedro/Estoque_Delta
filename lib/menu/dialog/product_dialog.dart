import 'package:estoque_delta/menu/dialog/queryContent.dart';
import 'package:estoque_delta/menu/dialog/confirm_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog(this.infos, {super.key});

  final Map infos;

  @override
  State<ProductDialog> createState() {
    return _Product(infos);
  }
}

class _Product extends State<ProductDialog> {
  _Product(this.infos);

  final Map infos;
  Widget? activateContent;
  List<Widget>? actions;

  @override
  void initState() {
    activateContent = QueryContent(infos);
    actions = [
      TextButton(
          onPressed: () => Navigator.pop(context), child: Text('Fechar')),
      TextButton(onPressed: _submit, child: Text('Confirmar')),
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
      actions: actions,
    );
  }
}
