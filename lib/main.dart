import 'package:flutter/material.dart';
import 'package:flutter_application_cine/movieDetails.dart';
import 'package:flutter_application_cine/pages/homescreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

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
        builder: (context, state) => Column(children: [
              Text('je suis la page des favoris'),
              TextButton(
                onPressed: () => context.go('/'),
                child: Text('Go back home'),
              ),
              TextButton(
                onPressed: () => context.go('/boubou'),
                child: Text('Boubou?'),
              )
            ])),
    GoRoute(
        path: '/boubou',
        builder: (context, state) => MovieDetails()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'CineDuRat',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.deepPurple),
    );
  }
}
