import 'package:flutter/material.dart';
import 'package:estoque_delta/login/login.dart';
import 'package:estoque_delta/menu/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _App();
  }
}

class _App extends State<App> {
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
        theme: ThemeData(useMaterial3: true),
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
