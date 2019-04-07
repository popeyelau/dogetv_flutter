import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';

enum HomePageAction {
  onLoad,
  onFetch,
  didLoad,
  onShowTV,
  onShowLibrary,
  onShowVideo,
  onShowSearch,
}

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

  static Action onShowLibrary() {
    return Action(HomePageAction.onShowLibrary);
  }

  static Action onShowVideoAction(String videoId) {
    return Action(HomePageAction.onShowVideo, payload: videoId);
  }

  static Action onShowSearchAction() {
    return Action(HomePageAction.onShowSearch);
  }
}
