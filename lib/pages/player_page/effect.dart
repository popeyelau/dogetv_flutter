import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

Effect<PlayerPageState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<PlayerPageState> ctx) async {
  List<DeviceOrientation> orientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ];
  SystemChrome.setPreferredOrientations(orientations);
}

void _dispose(Action action, Context<PlayerPageState> ctx) async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    ctx.state.videoController.pause();
    ctx.state.videoController.dispose();
    ctx.state.chewieController.dispose();
  });
}
