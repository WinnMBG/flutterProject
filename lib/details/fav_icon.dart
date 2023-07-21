import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';

class FavIcon extends StatelessWidget {
  final dynamic movieData;

  const FavIcon({this.movieData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesModel = Provider.of<MoviesModel>(context);
    final isFavorite = moviesModel.favoriteMovies
        .contains(movieData); // Vérifier si le film est un favori

    return IconButton(
      onPressed: () {
        // Inverser l'état du film entre favori et non favori
        if (isFavorite) {
          moviesModel.removeMovieFromFavorites(movieData);
        } else {
          moviesModel.favoriteMovies = [
            ...moviesModel.favoriteMovies,
            movieData,
          ];
        }
      },
      icon: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red : Colors.white,
      ),
    );
  }
}
