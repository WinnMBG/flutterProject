import 'package:flutter/material.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

class MoviesList extends StatefulWidget {
  MoviesList({super.key});

  @override
  State<StatefulWidget> createState() => _MoviesList();
}

class _MoviesList extends State<MoviesList> {
  List<Widget> createListIHM(List<dynamic> datas) {
    List<Widget> list = [];
    for (int i = 0; i < datas.length; i++) {
      list.add(Movie(datas[i]));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Consumer<MoviesModel>(
            builder: (context, value, child) {
              return Column(children: createListIHM(value.moviesDb));
            },
          )),
    );
  }
}
