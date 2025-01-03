import 'package:estoque_delta/data/products_data.dart';
import 'package:estoque_delta/models/card_menu.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() {
    return _Products();
  }
}

class _Products extends State<Products> {
  String textChange = 'Sesas Num.: Null';
  var random = Random();

  void method() {
    int randomNum = random.nextInt(11);
    setState(() {
      textChange = 'Sesas Num.: $randomNum';
    });
  }

  @override
  Widget build(context) {
    return Column(children: [
      Text(
        'Lista de Produtos',
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Refrigerante')),
          ElevatedButton(onPressed: () {}, child: Text('Suco')),
          ElevatedButton(onPressed: () {}, child: Text('Água'))
        ],
      ),
      Text(
        textChange,
        style: TextStyle(fontSize: 20),
      ),
      SizedBox(
          height: 150,
          child: SingleChildScrollView(
            child: Column(
                children: productsData.map((infos) {
              return ProductCard(infos, method);
            }).toList()),
          )),
      TextButton.icon(
          onPressed: method,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              minimumSize: Size(40, 40)),
          icon: const Icon(Icons.import_contacts_sharp),
          label: const Text('Enviar')),
    ]);
  }
}
