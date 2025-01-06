import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.method, {super.key});

  final Map infos;
  final void Function() method;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ListTile(
            leading: Image.asset(
              'assets/images/deltaprice_hori.png',
              width: 20,
            ),
            title: Text(infos['titulo']),
            subtitle: Text(
              '$infos['volume'] - R\$ $infos["preco"]',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.start,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text('ACTION 1'),
              ),
            ],
          ),
        ]));
  }
}
