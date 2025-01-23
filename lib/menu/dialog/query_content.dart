import 'package:flutter/material.dart';

class QueryContent extends StatelessWidget {
  const QueryContent(this.infos, {super.key});

  final Map infos;

  @override
  Widget build(BuildContext context) {
    String? titulo = infos['title'];
    double? preco = infos['price'];
    String urlImage = infos['image'];

    var noImageWidget = Image.asset(
      'assets/images/no_image.png',
      height: 100,
      color: Colors.black,
    );

    return Column(
      children: [
        Text(
          'Confirmar a escolher o produto a baixo?',
          style: TextStyle(fontSize: 15),
        ),
        Card(
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
                            child: (urlImage != '')
                              ? Image.network(
                                  urlImage,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      noImageWidget,
                                )
                              : noImageWidget,
                          ),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 12.5, 2.0, 0.0),
                            child: ListTile(
                              title: Text('$titulo'),
                              titleAlignment: ListTileTitleAlignment.center,
                              subtitle: Text(
                                'R\$ $preco',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ))
                        ]))))
      ],
    );
  }
}
