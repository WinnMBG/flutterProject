import 'package:flutter/material.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

class MoviesList extends StatelessWidget {
  MoviesList({super.key});

  List<Widget> createListIHM(List<dynamic> datas) {
    return datas.map((e) => Movie(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width < 600
                  ? 1
                  : (MediaQuery.of(context).size.width >= 600 &&
                          MediaQuery.of(context).size.width < 870
                      ? 2
                      : (MediaQuery.of(context).size.width >= 870 &&
                              MediaQuery.of(context).size.width < 1200
                          ? 3
                          : 4)),
              // childAspectRatio:
              //     MediaQuery.of(context).size.width > 600 ? 1 : 0.4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 0.0,
              children: createListIHM(value.movies)),
        );
      },
    );
  }
}
