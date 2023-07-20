// ignore: file_names
import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  String? title;

  MovieTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    print(title);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(title != null ? title! : 'Tenet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    )),
                Text(
                  'Sortie : 24 JUILLET 2024',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
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
