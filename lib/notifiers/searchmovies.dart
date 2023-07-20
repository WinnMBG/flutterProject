import 'package:flutter/material.dart';

class MoviesModel extends ChangeNotifier {
  List<dynamic> moviesDb = [];
  List<dynamic> favoriteMoviesDb = [];

  MoviesModel() {
    _initFavoriteMoviesDb();
  }

  void _initFavoriteMoviesDb() {
    favoriteMoviesDb = [
      {
        "original_title": "Marvel Rising: Chasing Ghosts",
        "poster_path": "/pufQvXrrxng95dT4kYlQtXn98kK.jpg",
        "release_date": "2019-01-16"
      },
      {
        "original_title": "Captain Marvel",
        "poster_path": "/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg",
        "release_date": "2019-03-08"
      },
      {
        "original_title": "The Marvels",
        "poster_path": "/rp3cjGabBAVpZtKyY4jiwikzj3H.jpg",
        "release_date": "2023-11-10"
      },
      {
        "original_title": "Guardians of the Galaxy Vol. 3",
        "poster_path": "/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",
        "release_date": "2023-04-27"
      },
      {
        "original_title":
            "Marvel Studios Assembled: The Making of Ant-Man and the Wasp: Quantumania",
        "poster_path": "/xgfnWe9NFXT5o3QndRnU5ylkxyp.jpg",
        "release_date": "2023-07-19"
      },
      {
        "original_title": "Wee Sing in the Marvelous Musical Mansion",
        "poster_path": "/bHLxG2wASGGnddkjlomCUIbhD11.jpg",
        "release_date": "1992-09-04"
      },
      {
        "original_title":
            "Marvel Studios Assembled: The Making of Black Panther: Wakanda Forever",
        "poster_path": "/mYTPKWO7a4mHKLyksJgB8CMq9Qx.jpg",
        "release_date": "2023-02-08"
      },
      {
        "original_title":
            "Marvel One-Shot: A Funny Thing Happened on the Way to Thor's Hammer",
        "poster_path": "/njrOqsmFH4pxBrhcoslqLfw2OGk.jpg",
        "release_date": "2011-10-25"
      },
    ];
  }

  set movies(List<dynamic> value) {
    moviesDb = value;
    notifyListeners();
  }

  List<dynamic> get movies => moviesDb;
  List<dynamic> get favoriteMovies => favoriteMoviesDb;

  void addMovieToFavorites(dynamic movie) {
    favoriteMoviesDb.add(movie);
    notifyListeners();
  }

  void removeMovieFromFavorites(dynamic movie) {
    favoriteMoviesDb.remove(movie);
    notifyListeners();
  }
}
