import 'package:dogetv_flutter/pages/tv_page/action.dart';
import 'package:dogetv_flutter/pages/tv_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

Reducer<TVPageState> buildReducer() {
  return asReducer(<Object, Reducer<TVPageState>>{
    TVPageAction.didLoad: didLoad,
    TVPageAction.onUpdateSource: onUpdateSource,
  });
}

TVPageState didLoad(TVPageState state, Action action) {
  TVPageState newState = state.clone();
  List<TV> groups = action.payload["groups"];
  bool isIPTV = action.payload["isIPTV"];
  newState.groups = groups;
  newState.isIPTV = isIPTV;
  return newState;
}

TVPageState onUpdateSource(TVPageState state, Action action) {
  TVPageState newState = state.clone();
  newState.isIPTV = !newState.isIPTV;
  return newState;
}
