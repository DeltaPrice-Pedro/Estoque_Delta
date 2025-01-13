import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  const InputLogin(this.title, this.method, {super.key});

  final String title;
  final void Function(String) method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            onSubmitted: method,
            decoration: InputDecoration(
              label: Text(
                title,
                style: GoogleFonts.oswald(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
                selectionColor: const Color.fromARGB(255, 31, 76, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}
