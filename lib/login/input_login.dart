import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  InputLogin(this.name, this.valueEntered, {super.key});

  final String name;
  String valueEntered = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            onSubmitted: (value) {
              valueEntered = value;
            },
            decoration: InputDecoration(
              label: Text(
                name,
                style: GoogleFonts.oswald(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.left,
                selectionColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
