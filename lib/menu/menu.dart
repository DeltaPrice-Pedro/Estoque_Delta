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
  Widget profilePage = Profile('Wellington Celestino');
  Widget productsPage = Products();
  Widget activatePage = Products();
  IconData activatePerfil = Icons.account_circle_outlined;

  bool menuState = true;

  switchPage() {
    setState(() {
      activatePage = menuState ? profilePage : productsPage;
    });
    menuState = !menuState;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              verticalDirection: VerticalDirection.up,
              children: [
                Image.asset(
                  'assets/images/deltaprice_hori.png',
                  width: 300,
                ),
                SizedBox(
                  height: 70,
                  width: 2,
                  child: ColoredBox(
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: switchPage,
                  icon: menuState
                      ? Icon((Icons.account_circle_outlined))
                      : Icon(Icons.account_circle_rounded),
                  alignment: Alignment.center,
                  color: Colors.lightBlue,
                  splashColor: Colors.lightBlueAccent,
                  iconSize: 40,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          activatePage,
        ],
      ),
    );
  }
}
