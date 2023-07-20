import 'package:flutter/material.dart';

import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:flutter_application_cine/pages/favorites.dart';
import 'package:flutter_application_cine/movieDetails.dart';

import 'package:flutter_application_cine/pages/homescreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => Favorites(),
    ),
    GoRoute(
        path: '/boubou',
        builder: (context, state) => MovieDetails()),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesModel(),
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'CineDuRat',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
