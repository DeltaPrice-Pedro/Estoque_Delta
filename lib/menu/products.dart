import 'package:estoque_delta/data/products_data.dart';
import 'package:estoque_delta/models/menu_card.dart';
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
      Row(
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
      SizedBox(
        height: 400,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: productsData.length,
          itemBuilder: (cntx, index) => ProductCard(productsData[index]),
        ),
      ),
    ]);
  }
}
