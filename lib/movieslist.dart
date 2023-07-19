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
    List<Widget> finalList = [];
    List<Widget> listTmp = [];
    late Widget rowTmp;
    for (int i = 1; i <= datas.length; i++) {
      if ((listTmp.length == 4) ||
          ((i == datas.length) && (listTmp.isNotEmpty))) {
        rowTmp = Padding(
            padding: EdgeInsets.only(top: 30), child: Row(children: listTmp));
        finalList.add(rowTmp);
        listTmp = [];
      }
      listTmp.add(Movie(datas[i - 1]));
    }
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Consumer<MoviesModel>(
            builder: (context, value, child) {
              return Column(children: createListIHM(value.moviesDb));
            },
          )),
    );
  }
}
