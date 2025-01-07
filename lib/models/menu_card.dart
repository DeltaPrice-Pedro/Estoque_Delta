import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.method, {super.key});

  final Map infos;
  final void Function() method;

  IconData choseIcon() {
    int tipo = infos['type'];
    return (tipo == 1)
        ? Icons.bubble_chart_rounded
        : (tipo == 2)
            ? Icons.water_drop_rounded
            : Icons.local_drink;
  }

  @override
  Widget build(BuildContext context) {
    String titulo = infos['title'];
    String volume = infos['volum'];
    String preco = infos['price'];
    int amount = infos['amount'];
    String urlImage = infos['image'];

    return Card(
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
                        padding: const EdgeInsets.fromLTRB(0.0, 12.5, 2.0, 0.0),
                        child: ListTile(
                          title: Text('$titulo - $volume ml'),
                          titleAlignment: ListTileTitleAlignment.center,
                          subtitle: Text(
                            'R\$ $preco',
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: (amount != 0)
                              ? Icon(Icons.check_circle_outline_rounded)
                              : Icon(Icons.remove_circle_outline_rounded),
                          enabled: (amount != 0) ? true : false,
                          leading: Icon(choseIcon(), size: 35,),
                          iconColor: Colors.blue,
                          onTap: () {
                            method;
                          },
                        ),
                      ))
                    ]))));
  }
}
