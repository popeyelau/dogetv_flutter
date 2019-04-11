import 'package:dogetv_flutter/pages/tv_page/action.dart';
import 'package:dogetv_flutter/pages/tv_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';

Effect<TVPageState> buildEffect() {
  return combineEffects(<Object, Effect<TVPageState>>{
    Lifecycle.initState: _init,
    TVPageAction.onUpdateSource: _onUpdateSource
  });
}

void _init(Action action, Context<TVPageState> ctx) async {
  APIs.getTVChannels(isIPTV: ctx.state.isIPTV).then((groups) {
    ctx.dispatch(TVPageActionCreator.didLoadAction(groups, ctx.state.isIPTV));
  });
}

void _onUpdateSource(Action action, Context<TVPageState> ctx) async {
  bool isIPTV = !ctx.state.isIPTV;
  APIs.getTVChannels(isIPTV: isIPTV).then((groups) {
    ctx.dispatch(TVPageActionCreator.didLoadAction(groups, isIPTV));
  });
}
