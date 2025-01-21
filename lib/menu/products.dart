import 'package:estoque_delta/menu/widgets/product_card.dart';
import 'package:estoque_delta/data/products_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() {
    return _Products();
  }
}

class _Products extends State<Products> {
  @override
  Widget build(context) {
    return Column(children: [
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Text('Refrigerante', style: GoogleFonts.poppins())),
            ElevatedButton(
                onPressed: () {},
                child: Text('Suco', style: GoogleFonts.poppins())),
            ElevatedButton(
                onPressed: () {},
                child: Text('Água', style: GoogleFonts.poppins()))
          ],
        ),
      ),
      SizedBox(
          height: 400,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
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
                  itemBuilder: (cntx, index) =>
                      ProductCard(loadedProducts[index].data()));
            },
          )),
    ]);
  }
}


// ListView.builder(
//           padding: const EdgeInsets.all(20),
//           itemCount: productsData.length,
//           itemBuilder: (cntx, index) => ProductCard(productsData[index]),
//         ),