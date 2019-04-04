import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';

enum HomePageAction { onLoad, onFetch, didLoad, onShowTV, onShowTopic }

class HomePageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(HomePageAction.onLoad, payload: isLoading);
  }

  static Action onFetchAction() {
    return Action(HomePageAction.onFetch);
  }

  static Action didLoadAction(Home home) {
    return Action(HomePageAction.didLoad, payload: home);
  }

  static Action onShowTV() {
    return Action(HomePageAction.onShowTV);
  }

  static Action onShowTopicAction(Topic topic) {
    Map<String, dynamic> payload = {"topic": topic};
    return Action(HomePageAction.onShowTopic, payload: payload);
  }
}
