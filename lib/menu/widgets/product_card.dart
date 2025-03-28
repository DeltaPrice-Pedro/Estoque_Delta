import 'package:flutter/material.dart';
import 'package:estoque_delta/menu/dialog/product_dialog.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.infos, this.docID, {super.key});

  final Map infos;
  final String docID;

  @override
  Widget build(BuildContext context) {
    String? titulo = infos['title'];
    dynamic preco = infos['price'];
    int? amount = infos['amount'];
    String? urlImage = infos['image'];

    var noImageWidget = Image.asset(
      'assets/images/no_image.png',
      height: 100,
      color: Colors.black,
    );
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
                          child: (urlImage != '')
                              ? Image.network(
                                  urlImage!,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      noImageWidget,
                                )
                              : noImageWidget),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 12.5, 2.0, 0.0),
                        child: ListTile(
                          title: Text(titulo!),
                          titleAlignment: ListTileTitleAlignment.center,
                          subtitle: Text(
                            'R\$ $preco - Disponível: $amount',
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: (amount != 0)
                              ? Icon(Icons.check_circle_outline_rounded)
                              : Icon(Icons.remove_circle_outline_rounded),
                          enabled: (amount != 0) ? true : false,
                          iconColor: Colors.blue,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ProductDialog(infos, docID));
                          },
                        ),
                      ))
                    ]))));
  }
}
