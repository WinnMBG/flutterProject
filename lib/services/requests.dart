import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter/material.dart';

class TDMBCilent {
  TDMBCilent();
  final tmdbWithCustomLogs = TMDB(
    ApiKeys('5858ee6eb60999e939c81351b632d815',
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODU4ZWU2ZWI2MDk5OWU5MzljODEzNTFiNjMyZDgxNSIsInN1YiI6IjYyZWE5OWNhMWU2NDg5MDA1ZGMwYmVjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.u0eMpMCOmE2pXO8LbQ-aQsR2hgbTfsAuIIuy8SWG4ok'),
    logConfig: const ConfigLogger(
      showLogs: true, //must be true than only all other logs will be shown
      showErrorLogs: true,
    ),
  );

  Future<Map> getMoviesBySearch(String search) async {
    return tmdbWithCustomLogs.v3.search.queryMovies(search);
  }
}
