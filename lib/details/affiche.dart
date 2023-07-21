import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_cine/youtubeplayer.dart';

class Affiche extends StatelessWidget {
  String? posterPath;
  Map? videos;

  Affiche(this.posterPath, this.videos, {Key? key}) : super(key: key);

  String? getYoutubeKey(Map? videos) {
    String key = '';
    print('resluts ${videos!['results']}');
    for (dynamic i in videos!['results']) {
      if ((i!['type'] as String).contains('Trailer')) {
        key = i!['key'];
      }
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    print(videos.toString());
    String? key = getYoutubeKey(videos);
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
        alignment: Alignment.topCenter,
        child: key != ''
            ? YoutubePlayerEx(key)
            // Image.network("https://image.tmdb.org/t/p/w500${posterPath}",
            //     width: min(screenWidth * 1, 900))
            : (posterPath != null
                ? Image.network(
                    'https://image.tmdb.org/t/p/w500$posterPath',
                    width: min(screenWidth * 1, 900),
                  )
                : Image.asset(
                    'images/poster.jpg',
                    width: min(screenWidth * 1, 900),
                  )));
  }
}
