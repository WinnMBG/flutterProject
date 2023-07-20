import 'package:flutter/material.dart';

class MoviesModel extends ChangeNotifier {
  List<dynamic> moviesDb = [];
  List<dynamic> favoriteMoviesDb = [];

  // MoviesModel() {
  //   _initFavoriteMoviesDb();
  // }

  void _initFavoriteMoviesDb() {
    favoriteMoviesDb = [];
  }

  set movies(List<dynamic> value) {
    moviesDb = value;
    notifyListeners();
  }

  List<dynamic> get movies => moviesDb;
  List<dynamic> get favoriteMovies => favoriteMoviesDb;

  set addMovieToFavorites(List<dynamic> movie) {
    favoriteMoviesDb = movies;
    notifyListeners();
  }

  void removeMovieFromFavorites(dynamic movie) {
    favoriteMoviesDb.remove(movie);
    notifyListeners();
  }
}
