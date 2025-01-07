import 'package:estoque_delta/data/history_data.dart';
import 'package:estoque_delta/models/history_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(this.nomeUsuario, {super.key});

  final String nomeUsuario;

  String greeting() {
    int currentHour = DateTime.now().hour;
    String timeGreeting = (currentHour < 12)
        ? 'Bom dia'
        : (currentHour > 12 && currentHour < 18)
            ? 'Boa tarde'
            : 'Boa noite';
    return '$timeGreeting, $nomeUsuario';
  }

  @override
  Widget build(context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        verticalDirection: VerticalDirection.down,
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
      Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            height: 330,
            child: SingleChildScrollView(
              child: Column(
                  children: historyData.map((history) {
                return HistoryCard(history);
              }).toList()),
            )),
      )
    ]);
  }
}
