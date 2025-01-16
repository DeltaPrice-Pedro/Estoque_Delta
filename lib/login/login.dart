// import 'package:estoque_delta/login/input_login.dart';
import 'package:estoque_delta/login/warning_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();
var _emailUser = '';
var _passwrdUser = '';

class Login extends StatelessWidget {
  const Login({super.key});

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _sendToFirebase();
    } else {
      return;
    }
  }

  _sendToFirebase() {
    try {
      final userCredentials = _firebase.signInWithEmailAndPassword(
          email: _emailUser, password: _passwrdUser);
      print(userCredentials);
    } on FirebaseAuthException catch (error) {
      showDialog(
          context: (context),
          builder: (context) =>
              WarningDialog(error.message ?? 'Dados inválidos'));
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(124, 255, 255, 255),
                        spreadRadius: 10,
                        blurRadius: 30,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Text(
                      'Bem vindo(a) a lojinha',
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Endereço de e-mail'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Favor insira um endereço de e-mail válido.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _emailUser = value!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'A senha deve ter no mínimo 6 caracteres.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _passwrdUser = value!;
                        },
                      ),

                      //InputLogin(),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: ElevatedButton(
                          onPressed: _submit,
                          // style: ButtonStyle(backgroundColor: Colors.white),
                          child: Text(
                            "Enviar",
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
