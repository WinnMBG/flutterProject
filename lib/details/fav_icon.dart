import 'package:flutter/material.dart';
import 'package:flutter_application_cine/movies.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';

class FavIcon extends StatelessWidget {
  final dynamic movie;

  const FavIcon(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(builder: (context, value, child) {
      return IconButton(
        onPressed: () {
          if (value.favoriteMovies.contains(movie)) {
            value.removeMovieFromFavorites(movie);
          } else if (value.favoriteMovies
              .any((favoriteMovie) => favoriteMovie['id'] == movie['id'])) {
            value.removeMovieFromFavoritesWithId(movie);
          } else {
            value.favoriteMovies = [
              ...value.favoriteMovies,
              movie,
            ];
          }
        },
        icon: Icon(
          Icons.favorite,
          color: value.favoriteMovies
                  .any((favoriteMovie) => favoriteMovie['id'] == movie['id'])
              ? Colors.red
              : Colors.blueGrey,
        ),
      );
    });
  }
}
