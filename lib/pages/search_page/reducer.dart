import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/search_page/action.dart';
import 'package:dogetv_flutter/pages/search_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<SearchPageState> buildReducer() {
  return asReducer(<Object, Reducer<SearchPageState>>{
    SearchPageAction.onFetch: onFetch,
    SearchPageAction.didLoad: didLoad,
    SearchPageAction.didLoadMore: didLoadMore,
  });
}

SearchPageState onFetch(SearchPageState state, Action action) {
  SearchPageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

SearchPageState didLoad(SearchPageState state, Action action) {
  SearchPageState newState = state.clone();
  List<Video> results = action.payload;
  newState.results = results;
  newState.isLoading = false;
  return newState;
}

SearchPageState didLoadMore(SearchPageState state, Action action) {
  SearchPageState newState = state.clone();
  List<Video> results = action.payload;
  newState.pageIndex++;
  newState.results.addAll(results);
  newState.isLoading = false;
  return newState;
}
