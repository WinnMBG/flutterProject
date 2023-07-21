import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_cine/services/requests.dart';

void main() {
  group('Counter', () {
    bool findTrailer(List? videos) {
      // print('resluts ${videos!['results']}');
      for (Map? i in videos!) {
        if ((i!['type'] as String).contains('Trailer')) {
          return true;
        }
      }
      return false;
    }

    test('get Movies by search', () async {
      await dotenv.load(fileName: '.env');
      Map value = await TDMBCilent().getMoviesBySearch('Avengers');
      final test = value.values.elementAt(1);
      expect(test.length, 20);
    });
    test('get movie by id', () async {
      await dotenv.load(fileName: '.env');
      Map value = await TDMBCilent().getMovieById(368304);
      expect(value['original_title'],
          'LEGO Marvel Super Heroes: Avengers Reassembled!');
    });
    test('get videos by movie id', () async {
      await dotenv.load(fileName: '.env');
      Map value = await TDMBCilent().getVideosByMovieId(368304);
      List videos = value['results'];
      assert(!findTrailer(videos));
    });
  });
}
