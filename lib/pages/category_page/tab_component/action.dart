import 'package:dogetv_flutter/models/category.dart';
import 'package:fish_redux/fish_redux.dart';

enum CategoryTabPageAction {
  onLoad,
  onFetch,
  didLoad,
  onUpdateQuery,
  onLoadMore,
  didLoadMore,
  scollToTop,
}

class CategoryTabPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(CategoryTabPageAction.onLoad, payload: isLoading);
  }

  static Action scrollToTop() {
    return Action(CategoryTabPageAction.scollToTop);
  }

  static Action didLoadAction(CategoryVideo videos) {
    return Action(CategoryTabPageAction.didLoad, payload: videos);
  }

  static Action didLoadMoreAction(CategoryVideo videos) {
    return Action(CategoryTabPageAction.didLoadMore, payload: videos);
  }

  static Action onFetchAction(Category category) {
    return Action(CategoryTabPageAction.onFetch, payload: category);
  }

  static Action onLoadMoreAction() {
    return Action(CategoryTabPageAction.onLoadMore);
  }

  static Action onUpdateQuery() {
    return Action(CategoryTabPageAction.onUpdateQuery);
  }
}
