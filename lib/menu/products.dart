import 'package:estoque_delta/data/products_data.dart';
import 'package:estoque_delta/models/menu_card.dart';
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
      Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 2,
          width: 500,
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            height: 330,
            child: SingleChildScrollView(
              child: Column(
                  children: productsData.map((infos) {
                return ProductCard(infos, method);
              }).toList()),
            )),
      ),
    ]);
  }
}
