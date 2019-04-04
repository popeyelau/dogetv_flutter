import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

enum TVPageAction {
  onLoad,
  onFetch,
  didLoad,
}

class TVPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(TVPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(List<Channel> channels) {
    return Action(TVPageAction.didLoad, payload: channels);
  }

  static Action onFetchAction() {
    return Action(TVPageAction.onFetch);
  }
}
