// ignore: file_names
import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  String? title;
  String? releaseDate;

  MovieTitle(this.title, this.releaseDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(title != null ? title! : 'Tenet',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey,
                    )),
                Text(
                  'Sortie : $releaseDate',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
