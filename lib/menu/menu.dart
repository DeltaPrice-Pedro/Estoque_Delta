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
  Widget activatePage = Products();
  bool menuState = true;

  switchPage() {
    setState(() {
      activatePage = menuState == true ? Profile() : Products();
    });
    menuState = !menuState;
  }

  @override
  Widget build(context) {
    return Column(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              'assets/images/deltaprice_hori.png',
              width: 400,
            ),
          ),
          TextButton.icon(
              onPressed: switchPage,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20), minimumSize: Size(40, 40)),
              icon: const Icon(Icons.import_contacts_sharp),
              label: const Text('Perfil'))
        ],
      ),
      Text(
        'Menu',
        style: TextStyle(fontSize: 40),
      ),
      activatePage,
    ]);
  }
}
