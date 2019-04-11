import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

enum TVPageAction { onLoad, onFetch, didLoad, onUpdateSource }

class TVPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(TVPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(List<TV> groups, bool isIPTV) {
    Map<String, dynamic> payload = {"groups": groups, "isIPTV": isIPTV};
    return Action(TVPageAction.didLoad, payload: payload);
  }

  static Action onFetchAction() {
    return Action(TVPageAction.onFetch);
  }

  static Action onUpdateSourceAction() {
    return Action(TVPageAction.onUpdateSource);
  }
}
