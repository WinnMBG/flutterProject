import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TDMBCilent {
  TDMBCilent();
  final tmdbWithCustomLogs = TMDB(
    ApiKeys(dotenv.env['TMDB_API_KEY']!, dotenv.env['TMDB_API_TOKEN']!),
    logConfig: const ConfigLogger(
      showLogs: true, //must be true than only all other logs will be shown
      showErrorLogs: true,
    ),
  );

  Future<Map> getMoviesBySearch(String search) async {
    return tmdbWithCustomLogs.v3.search.queryMovies(search);
  }
}
