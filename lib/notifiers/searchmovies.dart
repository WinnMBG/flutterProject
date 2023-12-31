import 'package:flutter/material.dart';

class MoviesModel extends ChangeNotifier {
  List<dynamic> moviesDb = [];
  List<dynamic> favoriteMoviesDb = [];

  set movies(List<dynamic> value) {
    moviesDb = value;
    notifyListeners();
  }

  List<dynamic> get movies => moviesDb;
  List<dynamic> get favoriteMovies => favoriteMoviesDb;

  set favoriteMovies(List<dynamic> movies) {
    favoriteMoviesDb = movies;
    notifyListeners();
  }

  void removeMovieFromFavorites(dynamic movie) {
    favoriteMoviesDb.remove(movie);
    notifyListeners();
  }

  void removeMovieFromFavoritesWithId(dynamic movie) {
    favoriteMovies
        .removeWhere((favoriteMovie) => favoriteMovie['id'] == movie['id']);

    notifyListeners();
  }
}
