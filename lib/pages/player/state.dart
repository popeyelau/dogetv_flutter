import 'package:dogetv_flutter/models/episode.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayerPageState implements Cloneable<PlayerPageState> {
  String streamURL;
  List<Episode> episodes;
  VideoPlayerController videoController;
  ChewieController chewieController;
  bool isLive = false;

  @override
  PlayerPageState clone() {
    return PlayerPageState()
      ..streamURL = streamURL
      ..episodes = episodes
      ..videoController = videoController
      ..chewieController = chewieController;
  }
}

PlayerPageState initState(Map<String, dynamic> map) {
  String streamURL = map["url"];
  List<Episode> episodes = map["episodes"];
  bool isLive = map["live"] ?? false;
  PlayerPageState state = PlayerPageState();
  state.streamURL = streamURL;
  state.episodes = episodes;
  state.isLive = isLive;
  VideoPlayerController videoController =
      VideoPlayerController.network(streamURL);
  ChewieController chewieController = ChewieController(
    videoPlayerController: videoController,
    // aspectRatio: 16 / 9,
    autoPlay: true,
    fullScreenByDefault: isLive,
    isLive: isLive,
  );
  state.videoController = videoController;
  state.chewieController = chewieController;
  return state;
}
