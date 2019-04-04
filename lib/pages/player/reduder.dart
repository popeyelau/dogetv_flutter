import 'package:chewie/chewie.dart';
import 'package:dogetv_flutter/pages/player/action.dart';
import 'package:dogetv_flutter/pages/player/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/episode.dart';
import 'package:video_player/video_player.dart';

Reducer<PlayerPageState> buildReducer() {
  return asReducer(<Object, Reducer<PlayerPageState>>{
    PlayerPageAction.onChangeEpisode: onChangeEpisode,
  });
}

PlayerPageState onChangeEpisode(PlayerPageState state, Action action) {
  state.chewieController.pause();

  Episode episode = action.payload;
  PlayerPageState newState = state.clone();
  VideoPlayerController videoController =
      VideoPlayerController.network(episode.url);
  ChewieController chewieController = ChewieController(
      videoPlayerController: videoController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      fullScreenByDefault: false);
  newState.videoController = videoController;
  newState.chewieController = chewieController;
  return newState;
}
