import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';

enum TopicsPageAction {
  onLoad,
  onFetch,
  didLoad,
}

class TopicsPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(TopicsPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(List<Topic> topics) {
    return Action(TopicsPageAction.didLoad, payload: topics);
  }

  static Action onFetchAction() {
    return Action(TopicsPageAction.onFetch);
  }
}
