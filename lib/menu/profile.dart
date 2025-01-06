import 'package:flutter/material.dart';
import 'package:estoque_delta/data/history_data.dart';
import 'package:estoque_delta/models/history_card.dart';

class Profile extends StatelessWidget {
  const Profile(this.nomeUsuario, {super.key});

  final String nomeUsuario;

  @override
  Widget build(context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          Text(
            'Bom dia!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app_outlined),
            alignment: Alignment.centerRight,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
      Text(
        nomeUsuario,
        textAlign: TextAlign.center,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
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
      Text(
        'Histórico de uso',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      SizedBox(
          height: 150,
          child: SingleChildScrollView(
            child: Column(
                children: historyData.map((history) {
              return HistoryCard(history);
            }).toList()),
          )),
    ]);
  }
}
