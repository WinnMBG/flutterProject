import 'package:flutter/material.dart';
import 'package:flutter_application_cine/details/affiche.dart';
import 'package:flutter_application_cine/details/movie_title.dart';
import 'package:flutter_application_cine/details/synopsys.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'details/fav_icon.dart';

class MovieDetails extends StatelessWidget {
  dynamic data;

  MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(0, 15, 4, 4),
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
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
        body: ChangeNotifierProvider(
          create: (BuildContext context) {
            return;
          },
          child: ListView(

              // child: Text('Hello World smeh'),
              children: const [
                MovieTitle(),
                Affiche(),
                FavIcon(),
                Synopsis()
              ]),
        ));
  }
}
