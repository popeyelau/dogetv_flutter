import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';

enum SearchPageAction {
  onLoad,
  onLoadMore,
  didLoadMore,
  onFetch,
  didLoad,
}

class SearchPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(SearchPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(List<Video> results) {
    return Action(SearchPageAction.didLoad, payload: results);
  }

  static Action onFetchAction() {
    return Action(SearchPageAction.onFetch);
  }

  static Action onLoadMoreAction() {
    return Action(SearchPageAction.onLoadMore);
  }

  static Action didLoadMoreAction(List<Video> results) {
    return Action(SearchPageAction.didLoadMore, payload: results);
  }
}
