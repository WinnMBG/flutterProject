import 'package:flutter/material.dart';
import 'package:flutter_application_cine/details/fav_icon.dart';
import 'package:flutter_application_cine/movies.dart';

import 'package:flutter_application_cine/notifiers/searchmovies.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Image.network(
                    "https://th.bing.com/th/id/OIP.19eOcs_L9HWel9NYlfZZrwHaHa?w=195&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                    width: 20,
                    height: 20,
                  ),
                ),
                Text('CinéRat')
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
                onPressed: () => context.go('/favorites'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
                onPressed: () => context.go('/'),
              )
            ],
          ),
          body: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Mes Favoris',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Consumer<MoviesModel>(
                        builder: (context, value, child) {
                          List<dynamic> favoriteMovies = value.favoriteMovies;
                          //print(favoriteMovies);
                          final int rows = (favoriteMovies.length / 4).ceil();

                          return Column(
                            children: List.generate(rows, (rowIndex) {
                              final int startIndex = rowIndex * 4;
                              final int endIndex =
                                  (rowIndex + 1) * 4 < favoriteMovies.length
                                      ? (rowIndex + 1) * 4
                                      : favoriteMovies.length;
                              final List<dynamic> rowMovies =
                                  favoriteMovies.sublist(startIndex, endIndex);

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                child: Row(
                                  children: rowMovies
                                      .map(
                                        (movie) => Column(
                                          children: [
                                            Movie(movie),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
