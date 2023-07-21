import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cine/movieslist.dart';
import 'package:flutter_application_cine/notifiers/searchmovies.dart';
import 'package:flutter_application_cine/pages/homescreen.dart';
import 'package:flutter_application_cine/searchbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test HomeScreen Widget', (WidgetTester tester) async {
    await dotenv.load(fileName: '.env');
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<MoviesModel>(
          create: (context) => MoviesModel(),
          child:
              HomeScreen()), // Replace this with your actual MaterialApp setup
    ));

    // Verify that the CarouselSlider is displayed.
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Verify that the AppBar is displayed.
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the SearchBarClass is displayed.
    expect(find.byType(SearchBarClass), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(SearchBar), 'hi');
    await Future.delayed(const Duration(seconds: 5));

    // await tester.tap(find.byType(InkWell));
    // Verify that the MoviesList is displayed.
    expect(find.byType(MoviesList), findsOneWidget);
  });
}
