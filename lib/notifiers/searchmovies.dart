import 'package:flutter/material.dart';

class MoviesModel extends ChangeNotifier {
  List<dynamic> moviesDb = [];
  List<dynamic> favoriteMoviesDb = [];

  set movies(List<dynamic> value) {
    moviesDb = value;
    notifyListeners();
  }

  List<dynamic> get movies => moviesDb;
}
