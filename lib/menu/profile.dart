import 'package:estoque_delta/data/history_data.dart';
import 'package:estoque_delta/models/history_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(this.nomeUsuario, {super.key});

  final String nomeUsuario;

  String greeting() {
    int currentHour = DateTime.now().hour - 3;
    return (currentHour < 12)
        ? 'Bom dia, '
        : (currentHour > 12 && currentHour < 18)
            ? 'Boa tarde, '
            : 'Boa noite, ';
  }

  @override
  Widget build(context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        verticalDirection: VerticalDirection.down,
        children: [
          Row(
            children: [
              Text(
                greeting(),
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                ),
              ),
              Text(
                nomeUsuario,
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
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
        'Histórico de consumo',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      SizedBox(
          height: 330,
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: historyData.length,
            itemBuilder: (cntx, index) => HistoryCard(historyData[index]),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
            ),
          ))
    ]);
  }
}
