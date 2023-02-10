import 'package:flutter/material.dart';
import 'package:jogo_matematica/acertou_page.dart';
import 'package:jogo_matematica/errou_page.dart';

import 'home_page.dart';

void main(List<String> args) {
  /*SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
  ]);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/acertou': (context) => AcertouPage(),
        '/errou': (context) => ErrouPage(),
      },
    );
  }
}
