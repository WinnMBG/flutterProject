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
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return Consumer<MoviesModel>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.count(
              crossAxisCount: isLargeScreen ? 4 : 1,
              childAspectRatio: isLargeScreen ? 1 : 0.4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 0.0,
              children: createListIHM(value.movies)),
        );
      },
    );
  }
}
