import 'package:flutter/material.dart';

class SearchBarClass extends StatefulWidget {
  const SearchBarClass({super.key});

  @override
  State<StatefulWidget> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBarClass> {
  String text = '';

  void cheng(String value) {
    setState(() {
      text = value;
    });
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
                      onChanged: cheng)),
              Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 30))
            ]));
  }
}
