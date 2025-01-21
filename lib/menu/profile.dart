import 'package:estoque_delta/menu/widgets/history_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
    // final user = FirebaseAuth.instance.currentUser!;
    // final userName = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .get();

    return Column(children: [
      SizedBox(
        height: 20,
      ),
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
                // userName.data()!['name'],
                'Funcionário',
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
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('history').snapshots(),
            builder: (cntx, productsSnapshots) {
              if (productsSnapshots.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!productsSnapshots.hasData ||
                  productsSnapshots.data!.docs.isEmpty) {
                return const Center(
                  child: Text('Sem produtos no histórico'),
                );
              }

              if (productsSnapshots.hasError) {
                return const Center(
                  child: Text('Algo deu errado...'),
                );
              }

              final loadedHistory = productsSnapshots.data!.docs;

              return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.white,
                      ),
                  itemCount: loadedHistory.length,
                  itemBuilder: (cntx, index) =>
                      HistoryCard(loadedHistory[index].data()));
            },
          ))
    ]);
  }
}


// ListView.separated(
//             padding: const EdgeInsets.all(20),
//             itemCount: historyData.length,
//             itemBuilder: (cntx, index) => HistoryCard(historyData[index]),
//             separatorBuilder: (context, index) => const Divider(
//               color: Colors.white,
//             ),
//           )