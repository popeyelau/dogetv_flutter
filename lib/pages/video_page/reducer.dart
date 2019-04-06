import 'package:dogetv_flutter/pages/video_page/action.dart';
import 'package:dogetv_flutter/pages/video_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video_detail.dart';

Reducer<VideoPageState> buildReducer() {
  return asReducer(<Object, Reducer<VideoPageState>>{
    VideoPageAction.didLoad: didLoad,
    // VideoPageAction.onUpdateSource: onUpdateSource,
    VideoPageAction.didUpdateSource: didUpdateSource,
  });
}

VideoPageState didLoad(VideoPageState state, Action action) {
  VideoPageState newState = state.clone();
  VideoDetail videoDetail = action.payload;
  newState.videoDetail = videoDetail;
  return newState;
}

VideoPageState didUpdateSource(VideoPageState state, Action action) {
  VideoPageState newState = state.clone();
  newState.source = action.payload["source"];
  newState.videoDetail.episodes = action.payload["episodes"];
  return newState;
}
