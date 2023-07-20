import 'package:flutter/material.dart';
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
//  dynamic data;
  bool isFavorite = false;

  //_Movie(this.data);

  void addToFavorite() {
    Provider.of<MoviesModel>(context, listen: false)
        .favoriteMoviesDb
        .add(widget.data);
    setState(() {
      isFavorite = !isFavorite;
    });
    print(Provider.of<MoviesModel>(context, listen: false).favoriteMoviesDb);
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
          onTap: () => context.go('/favorites'),
          child: img,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: TextButton(
                onPressed: () => context.go('/favorites'),
                child: Text(data['original_title'],
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          ),
          IconButton(
              onPressed: addToFavorite,
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.white,
              ))
        ])
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    return createMovieCard(widget.data, context);
  }
}
