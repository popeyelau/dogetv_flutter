import 'package:dogetv_flutter/pages/player/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

Effect<PlayerPageState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<PlayerPageState> ctx) async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

void _dispose(Action action, Context<PlayerPageState> ctx) async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ctx.state.videoController.dispose();
  ctx.state.chewieController.dispose();
}
