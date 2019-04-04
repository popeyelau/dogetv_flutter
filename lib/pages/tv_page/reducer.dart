import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';
import 'main.dart';

Reducer<TVPageState> buildReducer() {
  return asReducer(<Object, Reducer<TVPageState>>{
    TVPageAction.didLoad: didLoad,
  });
}

TVPageState didLoad(TVPageState state, Action action) {
  TVPageState newState = state.clone();
  List<Channel> channels = action.payload;
  newState.channels = channels;
  return newState;
}
