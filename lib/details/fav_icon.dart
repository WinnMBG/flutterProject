import 'package:flutter/material.dart';
import 'package:flutter_application_cine/movies.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';

class FavIcon extends StatelessWidget {
  final dynamic movie;

  const FavIcon(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final moviesModel = Provider.of<MoviesModel>(context);
    // final isFavorite = moviesModel.favoriteMovies
    //     .contains(movieData); // Vérifier si le film est un favori
    // print("Favorite : " + isFavorite.toString());

    return Consumer<MoviesModel>(builder: (context, value, child) {
      //print("the movie to studied is : " + movie.toString());
      print(
          "the list to studied is : " + value.favoriteMovies.length.toString());
      return IconButton(
        onPressed: () {
          // Inverser l'état du film entre favori et non favori
          if (value.favoriteMovies.contains(movie)) {
            value.removeMovieFromFavorites(movie);
            print("remove");
          } else if (value.favoriteMovies
              .any((favoriteMovie) => favoriteMovie['id'] == movie['id'])) {
            value.removeMovieFromFavoritesWithId(movie);
            print("remove where");
          } else {
            print("add");
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
              : Colors.blue,
        ),
      );
    });
  }
}
