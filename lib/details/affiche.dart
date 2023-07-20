import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_cine/youtubeplayer.dart';

class Affiche extends StatelessWidget {
  String? posterPath;
  Map? videos;
  final String urlVideo = 'https://www.youtube.com/watch?v=6ZfuNTqbHE8';

  Affiche(this.posterPath, this.videos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(videos.toString());
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: posterPath != null
          ? YoutubePlayerEx()
          // Image.network("https://image.tmdb.org/t/p/w500${posterPath}",
          //     width: min(screenWidth * 1, 900))
          : Image.asset(
              'images/tenet.jpg',
              width: min(screenWidth * 1, 900),
            ),
    );
  }
}
