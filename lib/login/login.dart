import 'package:estoque_delta/login/input_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
// import 'package:estoque_delta/login/inputLogin.dart';

class Login extends StatelessWidget {
  const Login(this.method, {super.key});

  final void Function() method;

  @override
  Widget build(context) {
    String nameInput = '';
    String pswrdInput = '';

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(124, 255, 255, 255),
              spreadRadius: 10,
              blurRadius: 30,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Text(
                'Bem vindo(a) ao estoque',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/deltaprice_hori.png',
                  width: 350,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 70.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputLogin('Nome completo', nameInput),
              InputLogin('Senha', pswrdInput),
            ],
          ),
        ),
        //InputLogin(),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: ElevatedButton(
            onPressed: method,
            // style: ButtonStyle(backgroundColor: Colors.white),
            child: Text(
              "Enviar",
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
