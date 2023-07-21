import 'package:flutter/material.dart';
import 'package:flutter_application_cine/details/fav_icon.dart';
import 'package:flutter_application_cine/movies.dart';

import 'package:flutter_application_cine/notifiers/searchmovies.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
      backgroundColor: const Color.fromARGB(0, 15, 4, 4),
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
                const Text('CinéRat')
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
          body: ListView(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
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

                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).size.width <
                                    600
                                ? 2
                                : (MediaQuery.of(context).size.width >= 600 &&
                                        MediaQuery.of(context).size.width < 870
                                    ? 3
                                    : (MediaQuery.of(context).size.width >=
                                                870 &&
                                            MediaQuery.of(context).size.width <
                                                1200
                                        ? 4
                                        :6)),
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                          ),
                          itemCount: favoriteMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            dynamic movie = favoriteMovies[index];
                            return Column(
                              children: [
                                Movie(movie),
                                SizedBox(height: 5),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]))
    ]);
  }
}
