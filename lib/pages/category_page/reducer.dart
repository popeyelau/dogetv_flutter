import 'package:dogetv_flutter/pages/category_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<CategoryPageState> buildReducer() {
  return asReducer(<Object, Reducer<CategoryPageState>>{});
}

CategoryPageState didChangedSource(CategoryPageState state, Action action) {
  CategoryPageState newState = CategoryPageState();
  return newState;
}
