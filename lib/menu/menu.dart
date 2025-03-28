import 'package:flutter/material.dart';
import 'package:estoque_delta/menu/products.dart';
import 'package:estoque_delta/menu/profile.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() {
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  final Widget profilePage = Profile();
  final Widget productsPage = Products();
  Widget activatePage = Products();

  bool menuState = true;

  switchPage() {
    setState(() {
      activatePage = menuState ? const Profile() : const Products();
      // activatePage = menuState ? profilePage : productsPage;
    });
    menuState = !menuState;
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              'assets/images/estoque_delta_hori.png',
              width: 300,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: switchPage,
              icon: menuState
                  ? Icon(Icons.account_circle_rounded)
                  : Icon(Icons.account_circle_outlined),
              alignment: Alignment.center,
              color: Colors.lightBlue,
              splashColor: Colors.lightBlueAccent,
              iconSize: 40,
            ),
            SizedBox(
              width: 40.0,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 26, 131, 250),
            const Color.fromARGB(255, 74, 158, 254),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          // alignment: Alignment.topCenter,
          child: Center(
            child: activatePage,
          ),
        ));
  }
}