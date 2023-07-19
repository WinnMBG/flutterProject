import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  dynamic data;

  Movie(this.data, {super.key});

  Widget createMovieCard(dynamic data) {
    return Row(
      children: [Text(data.toString())],
    );
  }

  @override
  Widget build(BuildContext context) {
    return createMovieCard(data);
  }
}
