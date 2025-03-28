import 'package:estoque_delta/menu/widgets/history_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final String userUid = FirebaseAuth.instance.currentUser!.uid;
var f = NumberFormat.decimalPattern('pt_BR');

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  final int currentHour = DateTime.now().hour - 3;

  final _userName =
      FirebaseFirestore.instance.collection('users').doc(userUid).get();

  @override
  Widget build(context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        verticalDirection: VerticalDirection.down,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    (currentHour < 12)
                        ? 'Bom dia, '
                        : (currentHour >= 12 && currentHour < 18)
                            ? 'Boa tarde, '
                            : 'Boa noite, ',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                  FutureBuilder(
                      future: _userName,
                      builder: (cntx, snapshot) {
                        return Column(
                          children: [
                            Text(
                              (!snapshot.hasData)
                                  ? 'Usuário'
                                  : snapshot.data!['name'],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        );
                      })
                ],
              ),
              FutureBuilder(
                  future: _userName,
                  builder: (cntx, snapshot) {
                    final valueSpent = (!snapshot.hasData)
                        ? '--'
                        : f.format(snapshot.data!['totalSpent']);
                    return Column(
                      children: [
                        Text(
                          'Total gasto: R\$ $valueSpent',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.dmSans(
                            color: const Color.fromARGB(255, 188, 223, 251),
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    );
                  })
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
          fontSize: 25,
        ),
      ),
      Expanded(
          flex: 1,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('history')
                .where('userUid', isEqualTo: userUid)
                .snapshots(),
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
                  child: Text(
                    'Sem produtos no histórico (～￣▽￣)～',
                    style: TextStyle(fontSize: 20),
                  ),
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