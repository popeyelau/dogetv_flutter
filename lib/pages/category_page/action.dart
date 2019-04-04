import 'package:dogetv_flutter/models/category.dart';
import 'package:fish_redux/fish_redux.dart';

enum CateogryPageAction {
  onLoad,
  onFetch,
  didLoad,
  didChangedCategory,
}

class CategoryPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(CateogryPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(CategoryVideo videos) {
    return Action(CateogryPageAction.didLoad, payload: videos);
  }

  static Action onFetchAction(Category category) {
    return Action(CateogryPageAction.onFetch, payload: category);
  }

  static Action didChangedCategory(Category category) {
    return Action(CateogryPageAction.didChangedCategory, payload: category);
  }
}
