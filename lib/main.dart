import 'package:flutter/material.dart';
import 'package:flutter_application_cine/searchbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CineDuRat',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(scaffoldBackgroundColor: Colors.deepPurple),
        home: Stack(children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.3,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: [
              "https://th.bing.com/th/id/OIP.QvXq4TCacvs7Z5KNl9V_tQHaFP?w=259&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              "https://th.bing.com/th/id/OIP.Zn8GD6ZZppjZG4B_57tiZAHaET?w=316&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              "https://th.bing.com/th/id/OIP.iWfgfj9-3pHTgCw2C4nU3gHaEK?w=267&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
            ]
                .map((item) => Container(
                      child: Center(
                        child: Image.network(
                          item,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ))
                .toList(),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black54,
                title: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Image.network(
                        "https://th.bing.com/th/id/OIP.19eOcs_L9HWel9NYlfZZrwHaHa?w=195&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text('MyAppCine')
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      // do something
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
              ),
              body: ListView(children: const [SearchBarClass()]))
        ]));
  }
}
