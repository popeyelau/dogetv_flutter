import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'main.dart';

Reducer<HomePageState> buildReducer() {
  return asReducer(<Object, Reducer<HomePageState>>{
    HomePageAction.didLoad: loadMovies,
    HomePageAction.onLoad: onLoad,
    Lifecycle.initState: _init,
  });
}

HomePageState _init(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

HomePageState loadMovies(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  Home home = action.payload;
  newState.home = home;
  newState.isLoading = false;
  return newState;
}

HomePageState onLoad(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  newState.isLoading = action.payload;
  return newState;
}
