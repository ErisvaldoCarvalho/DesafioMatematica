import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AcertouPage extends StatefulWidget {
  const AcertouPage({super.key});

  @override
  State<AcertouPage> createState() => _AcertouPageState();
}

class _AcertouPageState extends State<AcertouPage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.pop(context);
      timer.cancel();
    });
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.check,
              size: 32.0,
              color: Colors.green,
            ),
            Icon(
              Icons.done,
              size: 32.0,
              color: Colors.green,
            ),
            Icon(
              Icons.thumb_up,
              size: 32.0,
              color: Colors.green,
            ),
            Text('Parabéns você acertou!'),
          ],
        )
      ],
    );
  }
}
