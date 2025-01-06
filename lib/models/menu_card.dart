import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.method, {super.key});

  final Map infos;
  final void Function() method;

  IconData choseIcon() {
    int tipo = infos['tipo'];
    return (tipo == 1)
        ? Icons.bubble_chart_rounded
        : (tipo == 2)
            ? Icons.water_drop_rounded
            : Icons.local_drink;
  }

  @override
  Widget build(BuildContext context) {
    String titulo = infos['titulo'];
    String volume = infos['volume'];
    String preco = infos['preco'];

    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              'https://www.callfarma.com.br/_next/image?url=https%3A%2F%2Fd2lakedouw4zad.cloudfront.net%2Fcoca-cola-lata-350ml-74082.png&w=828&q=75',
              height: 100,
            ),
            ListTile(
              leading: Icon(choseIcon()),
              iconColor: Colors.blue,
              title: Text('$titulo - $volume ml'),
              titleAlignment: ListTileTitleAlignment.center,
              subtitle: Text(
                'R\$ $preco',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                print(infos);
              },
            ),
          ],
        ));
  }
}
