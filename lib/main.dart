import 'package:flutter/material.dart';
import 'package:estoque_delta/login/login.dart';
import 'package:estoque_delta/menu/menu.dart';

void main() => runApp(const InitPage());

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() {
    return _InitPage();
  }
}

class _InitPage extends State<InitPage> {
  Widget? activePage;

  @override
  void initState() {
    activePage = Login(switchPage);
    super.initState();
  }

  void switchPage() {
    setState(() {
      activePage = const Menu();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        title: 'Estoque Deltaprice',
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 26, 131, 250),
              const Color.fromARGB(255, 74, 158, 254),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            // alignment: Alignment.topCenter,
            child: Center(
              child: activePage,
            ),
          ),
        ));
  }
}
