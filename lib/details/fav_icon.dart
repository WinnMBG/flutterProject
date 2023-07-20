import 'package:flutter/material.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50,
              ),
    );
  }
}
