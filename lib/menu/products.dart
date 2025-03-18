import 'dart:ffi';

import 'package:estoque_delta/menu/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

List<String> itensFilter = ['soda', 'water', 'juice', 'chips', 'candy'];
List<String> itensFilterBase = ['soda', 'water', 'juice', 'chips', 'candy'];
List<bool> pressColorState = [true, false, false, false, false, false];
int currentColorID = 0;
int itensMaxLenght = itensFilter.length;

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() {
    return _Products();
  }
}

class _Products extends State<Products> {
  void updtFilter(String type, int idPress) {
    setState(() {
      if (type == 'all') {
        itensFilter = itensFilterBase;
      } else {
        itensFilter = [type];
      }
      pressColorState[currentColorID] = !pressColorState[currentColorID];
      pressColorState[idPress] = !pressColorState[idPress];
      currentColorID = idPress;
    });
  }

  ButtonStyle getColor(int idPres) {
    return ElevatedButton.styleFrom(
      foregroundColor: pressColorState[idPres] ? Colors.white : Colors.black,
      backgroundColor: pressColorState[idPres] ? Colors.black : Colors.white,
    );
  }

  @override
  Widget build(context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        height: 20,
      ),
      Text(
        'Produtos disponíveis',
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 40),
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
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  style: getColor(0),
                  onPressed: () => updtFilter('all', 0),
                  child: Text('Todos', style: GoogleFonts.poppins())),
              ElevatedButton(
                  style: getColor(1),
                  onPressed: () => updtFilter('soda', 1),
                  child: Text('Refrigerante', style: GoogleFonts.poppins())),
              ElevatedButton(
                  style: getColor(2),
                  onPressed: () => updtFilter('juice', 2),
                  child: Text('Suco', style: GoogleFonts.poppins())),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: getColor(3),
                    onPressed: () => updtFilter('water', 3),
                    child: Text('Água', style: GoogleFonts.poppins())),
                ElevatedButton(
                    style: getColor(4),
                    onPressed: () => updtFilter('chips', 4),
                    child: Text('Chips', style: GoogleFonts.poppins())),
                ElevatedButton(
                    style: getColor(5),
                    onPressed: () => updtFilter('candy', 5),
                    child: Text('Doces', style: GoogleFonts.poppins())),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('type', whereIn: itensFilter)
              .snapshots(),
          builder: (cntx, productsSnapshots) {
            if (productsSnapshots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!productsSnapshots.hasData ||
                productsSnapshots.data!.docs.isEmpty) {
              return const Center(
                child: Text('Sem produtos disponíveis'),
              );
            }

            if (productsSnapshots.hasError) {
              return const Center(
                child: Text('Algo deu errado...'),
              );
            }

            final loadedProducts = productsSnapshots.data!.docs;

            return ListView.builder(
                itemCount: loadedProducts.length,
                itemBuilder: (cntx, index) => ProductCard(
                    loadedProducts[index].data(), loadedProducts[index].id));
          },
        ),
      ),
    ]);
  }
}


// ListView.builder(
//           padding: const EdgeInsets.all(20),
//           itemCount: productsData.length,
//           itemBuilder: (cntx, index) => ProductCard(productsData[index]),
//         ),