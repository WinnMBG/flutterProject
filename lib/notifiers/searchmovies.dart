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
    print("remove 1");
    print(favoriteMoviesDb);
    print(movie);
    favoriteMoviesDb.remove(movie);
    print(favoriteMoviesDb);
    print('remove 2');
    notifyListeners();
  }
}
