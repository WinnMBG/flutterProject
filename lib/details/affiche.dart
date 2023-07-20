import 'dart:math';

import 'package:flutter/material.dart';

class Affiche extends StatelessWidget {
  const Affiche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'images/tenet.jpg',
        width: min(screenWidth * 1 , 900),
      ),
    );
  }
}
