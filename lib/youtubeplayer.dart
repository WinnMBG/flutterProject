import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerEx extends StatefulWidget {
  String? youtubeKey;
  YoutubePlayerEx(this.youtubeKey, {super.key});

  @override
  State<StatefulWidget> createState() => _YoutubePlayer();
}

class _YoutubePlayer extends State<YoutubePlayerEx> {
  late String urlVideo;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    urlVideo = 'https://www.youtube.com/watch?v=${widget.youtubeKey}';
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(urlVideo);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(autoPlay: true, forceHD: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
        controller: _controller, showVideoProgressIndicator: true);
  }
}
