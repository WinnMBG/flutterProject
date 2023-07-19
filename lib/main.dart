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
              height: MediaQuery.of(context).size.height * 1,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: [
              "https://www.cfmradio.fr/_img/__upload/870x489_043-dpa-pa-220910-99-705957-dpaijpg@44f.jpg",
              "https://newdawnfilm.com/wp-content/uploads/2020/06/shutterstock_169841813-min.png",
              "https://www.cia-france.fr/media/1492/les-films-incontournables-du-cinema-w_2524x884.jpg",
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
                    Text('CinéRat')
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
