import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card(this.titulo, this.preco, this.medida, this.imagem, this.method, {super.key});

  final String titulo;
  final String preco;
  final String medida;
  final String imagem;
  final void Function() method;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo),
          ElevatedButton(onPressed: method, child: const Text('Comprar'))
        ],
      ),
    );
  }
}
