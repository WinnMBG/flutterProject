import 'package:flutter/material.dart';
import 'package:flutter_application_cine/details/fav_icon.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class Movie extends StatefulWidget {
  dynamic data;

  Movie(this.data, {super.key});
  @override
  State<StatefulWidget> createState() => _Movie();
}

class _Movie extends State<Movie> {
  bool isFavorite = false;
  void addToFavorite() {
    Provider.of<MoviesModel>(context, listen: false)
        .favoriteMoviesDb
        .add(widget.data);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Widget createMovieCard(dynamic data, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String imgUrl = data['poster_path'] != null
        ? "https://image.tmdb.org/t/p/w500${data['poster_path']}"
        : "";
    Widget img = imgUrl.isNotEmpty
        ? Image.network(
            imgUrl,
            height: 250,
            width: screenWidth * 1,
          )
        : Image.asset("images/poster.jpg", height: 250, width: screenWidth * 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => context.go('/movie/${data['id']}'),
          child: img,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: TextButton(
                onPressed: () => context.go('/movie/${data['id']}'),
                child: Text(data['original_title'],
                    style: TextStyle(color: Colors.grey, fontSize: 15))),
          ),
          Consumer<MoviesModel>(builder: (context, value, child) {
            return FavIcon(data);
          }),
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return createMovieCard(widget.data, context);
  }
}
