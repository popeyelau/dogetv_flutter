import 'package:fish_redux/fish_redux.dart';
import 'main.dart';

Reducer<CategoryPageState> buildReducer() {
  return asReducer(<Object, Reducer<CategoryPageState>>{});
}

CategoryPageState didChangedSource(CategoryPageState state, Action action) {
  CategoryPageState newState = CategoryPageState();
  return newState;
}
