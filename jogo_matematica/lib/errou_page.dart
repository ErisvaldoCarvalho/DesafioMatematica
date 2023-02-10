import 'dart:async';

import 'package:flutter/material.dart';

class ErrouPage extends StatefulWidget {
  const ErrouPage({super.key});

  @override
  State<ErrouPage> createState() => _ErrouPageState();
}

class _ErrouPageState extends State<ErrouPage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.pop(context);
      timer.cancel();
    });

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check,
          size: 50,
          color: Colors.green,
        ),
      ],
    ));

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Título da tela'),
    //   ),
    //   body: Column(
    //     children: [
    //       Icon(
    //         Icons.close,
    //         size: 32.0,
    //         color: Colors.red,
    //       ),
    //       Icon(
    //         Icons.clear,
    //         size: 32.0,
    //         color: Colors.red,
    //       ),
    //       Icon(
    //         Icons.thumb_down,
    //         size: 32.0,
    //         color: Colors.red,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.of(context).pushNamed('/');
    //         },
    //         child: Icon(Icons.exit_to_app),
    //       ),
    //     ],
    //   ),
    // );
  }
}
