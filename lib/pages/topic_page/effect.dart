import 'package:dogetv_flutter/pages/topic_page/action.dart';
import 'package:dogetv_flutter/pages/topic_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/repository/movie.dart';

Effect<TopicDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<TopicDetailPageState>>{
    Lifecycle.initState: _init,
    TopicDetailPageAction.onFetch: _onFetch
  });
}

void _init(Action action, Context<TopicDetailPageState> ctx) async {
  APIs.getTopicDetail(ctx.state.topic.id).then((topics) {
    ctx.dispatch(TopicDetailPageActionCreator.didLoadAction(topics));
  });
}

void _onFetch(Action action, Context<TopicDetailPageState> ctx) async {
  APIs.getTopicDetail(ctx.state.topic.id).then((topics) {
    ctx.dispatch(TopicDetailPageActionCreator.didLoadAction(topics));
  });
}
