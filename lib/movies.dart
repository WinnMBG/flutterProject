import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  dynamic data;

  Movie(this.data, {super.key});

  Widget createMovieCard(dynamic data) {
    String imgUrl = data['poster_path'] != null
        ? "https://image.tmdb.org/t/p/w500${data['poster_path']}"
        : "";
    Widget img = imgUrl.isNotEmpty
        ? Image.network(
            imgUrl,
            height: 350,
            width: 350,
          )
        : Image.asset("images/poster.jpg", height: 350, width: 350);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        img,
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(data['original_title'],
                style: TextStyle(color: Colors.white)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return createMovieCard(data);
  }
}
