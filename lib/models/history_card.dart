import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.history, {super.key});

  final Map history;

  @override
  Widget build(BuildContext context) {
    String titulo = history['title'];
    String volume = history['volum'];
    String preco = history['price'];
    int amount = history['amount'];
    String urlImage = history['image'];

    return Card.outlined(
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
                          leading: Icon(choseIcon()),
                          iconColor: Colors.blue,
                          onTap: () {
                            method;
                          },
                        ),
                      ))
                    ]))));
  }
}

