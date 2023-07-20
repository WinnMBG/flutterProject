import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerEx extends StatefulWidget {
  YoutubePlayerEx({super.key});

  @override
  State<StatefulWidget> createState() => _YoutubePlayer();
}

class _YoutubePlayer extends State<YoutubePlayerEx> {
  final String urlVideo = 'https://www.youtube.com/watch?v=6ZfuNTqbHE8';

  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(urlVideo);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(autoPlay: false, forceHD: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
        controller: _controller, showVideoProgressIndicator: true);
  }
}
