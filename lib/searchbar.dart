import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:flutter_application_cine/services/requests.dart';
import 'package:provider/provider.dart';

class SearchBarClass extends StatefulWidget {
  const SearchBarClass({super.key});

  @override
  State<StatefulWidget> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBarClass> {
  String text = '';

  void onFilled(String value) async {
    print(value);
    setState(() {
      text = value;
    });
    Map test = await TDMBCilent().getMoviesBySearch(value);
    // print(json.encode(test));
    Provider.of<MoviesModel>(context, listen: false).movies =
        test.values.elementAt(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SearchBar(
                      hintText: 'Entrez le titre du film recherché...',
                      onChanged: onFilled)),
            ]));
  }
}
