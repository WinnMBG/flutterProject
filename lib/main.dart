import 'package:flutter/material.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:flutter_application_cine/pages/favorites.dart';
import 'package:flutter_application_cine/pages/homescreen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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
        builder: (context, state) => Column(children: [
              Text('je suis Boubou'),
              TextButton(
                onPressed: () => context.go('/'),
                child: Text('Go back home'),
              ),
              TextButton(
                onPressed: () => context.go('/favorites'),
                child: Text('Go to favorites ?'),
              )
            ])),
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
