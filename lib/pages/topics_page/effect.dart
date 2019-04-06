import 'package:dogetv_flutter/pages/topics_page/action.dart';
import 'package:dogetv_flutter/pages/topics_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';

Effect<TopicsPageState> buildEffect() {
  return combineEffects(<Object, Effect<TopicsPageState>>{
    Lifecycle.initState: _init,
    TopicsPageAction.onFetch: _onFetch
  });
}

void _init(Action action, Context<TopicsPageState> ctx) async {
  APIs.getTopics().then((topics) {
    ctx.dispatch(TopicsPageActionCreator.didLoadAction(topics));
  });
}

void _onFetch(Action action, Context<TopicsPageState> ctx) async {
  APIs.getTopics().then((topics) {
    ctx.dispatch(TopicsPageActionCreator.didLoadAction(topics));
  });
}
