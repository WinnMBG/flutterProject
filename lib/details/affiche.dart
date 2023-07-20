import 'dart:math';

import 'package:flutter/material.dart';

class Affiche extends StatelessWidget {
  String? posterPath;

  Affiche(this.posterPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: posterPath != null
          ? Image.network("https://image.tmdb.org/t/p/w500${posterPath}",
              width: min(screenWidth * 1, 900))
          : Image.asset(
              'images/tenet.jpg',
              width: min(screenWidth * 1, 900),
            ),
    );
  }
}
