import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.method ,{super.key});

  final Map infos;
  final void Function() method;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(infos['titulo']),
          ElevatedButton(onPressed: method, child: const Text('Comprar'))
        ],
      ),
    );
  }
}
