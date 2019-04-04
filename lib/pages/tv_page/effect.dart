import 'package:dogetv_flutter/pages/tv_page/action.dart';
import 'package:dogetv_flutter/pages/tv_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/repository/movie.dart';

Effect<TVPageState> buildEffect() {
  return combineEffects(<Object, Effect<TVPageState>>{
    Lifecycle.initState: _init,
    TVPageAction.onFetch: _onFetch
  });
}

void _init(Action action, Context<TVPageState> ctx) async {
  APIs.getTVChannels().then((channels) {
    ctx.dispatch(TVPageActionCreator.didLoadAction(channels));
  });
}

void _onFetch(Action action, Context<TVPageState> ctx) async {
  APIs.getTVChannels().then((channels) {
    ctx.dispatch(TVPageActionCreator.didLoadAction(channels));
  });
}
