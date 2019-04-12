import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<CategoryTabPageState> buildReducer() {
  return asReducer(<Object, Reducer<CategoryTabPageState>>{
    CategoryTabPageAction.didLoad: didLoad,
    CategoryTabPageAction.onFetch: onFetch,
    CategoryTabPageAction.onLoad: onLoad,
    CategoryTabPageAction.didLoadMore: didLoadMore,
    Lifecycle.initState: _init,
  });
}

CategoryTabPageState _init(CategoryTabPageState state, Action action) {
  CategoryTabPageState newState = state.clone();
  newState.isLoading = true;
  newState.current = Category.values.first;
  return newState;
}

CategoryTabPageState onLoad(CategoryTabPageState state, Action action) {
  CategoryTabPageState newState = state.clone();
  newState.isLoading = action.payload;
  return newState;
}

CategoryTabPageState didLoad(CategoryTabPageState state, Action action) {
  CategoryTabPageState newState = state.clone();
  CategoryVideo data = action.payload;
  if (newState.querys.isEmpty) {
    data.query.forEach((i) => i.options.first.isSelected = true);
    newState.data = data;
  } else {
    newState.data.items = data.items;
  }
  newState.isLoading = false;
  return newState;
}

CategoryTabPageState didLoadMore(CategoryTabPageState state, Action action) {
  CategoryTabPageState newState = state.clone();
  CategoryVideo data = action.payload;
  newState.isLoading = false;
  if (data?.items?.isNotEmpty ?? false) {
    newState.pageIndex++;
    newState.data.items.addAll(data.items);
  }
  return newState;
}

CategoryTabPageState onFetch(CategoryTabPageState state, Action action) {
  CategoryTabPageState newState = state.clone();
  Category category = action.payload;
  newState.isLoading = true;
  newState.current = category;
  return newState;
}
