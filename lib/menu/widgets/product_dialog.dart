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

  void _submit() async {
    final user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('history').doc(user.uid).set({
      'productName': infos['title'],
      'productPrice': infos['price'],
      'purchaseDateTime': DateTime.now()
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String titulo = infos['title'];
    int volume = infos['volumn'];
    double preco = infos['price'];
    String urlImage = infos['image'];

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
                              child: Image.network(
                                urlImage,
                                height: 100,
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 12.5, 2.0, 0.0),
                              child: ListTile(
                                title: Text('$titulo - $volume ml'),
                                titleAlignment: ListTileTitleAlignment.center,
                                subtitle: Text(
                                  'R\$ $preco',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ))
                          ]))))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
        TextButton(onPressed: _submit, child: Text('Confirmar')),
      ],
    );
  }
}
