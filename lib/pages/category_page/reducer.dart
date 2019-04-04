import 'package:fish_redux/fish_redux.dart';
import 'main.dart';

Reducer<CategoryPageState> buildReducer() {
  return asReducer(<Object, Reducer<CategoryPageState>>{
    CateogryPageAction.didLoad: didLoad,
  });
}

CategoryPageState didLoad(CategoryPageState state, Action action) {
  return state;
}
