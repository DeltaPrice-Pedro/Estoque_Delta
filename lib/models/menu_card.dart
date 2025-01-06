import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.method, {super.key});

  final Map infos;
  final void Function() method;

  @override
  Widget build(BuildContext context) {
    String titulo = infos['titulo'];
    String volume = infos['volume'];
    String preco = infos['preco'];

    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Image.asset(
          //   'assets/images/deltaprice_hori.png',
          //   width: 20,
          // ),
          Row(
            children: [
              ListTile(
                title: Text(titulo),
                subtitle: Text(
                  '$volume - R\$ $preco',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text('ACTION 1'),
                  ),
                ],
              ),
            ],
          )
        ]));
  }
}
