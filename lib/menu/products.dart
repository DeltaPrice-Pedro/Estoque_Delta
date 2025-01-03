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
        textChange,
        style: TextStyle(fontSize: 40),
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
