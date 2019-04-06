import 'package:dogetv_flutter/pages/topic_page/action.dart';
import 'package:dogetv_flutter/pages/topic_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video.dart';

Reducer<TopicDetailPageState> buildReducer() {
  return asReducer(<Object, Reducer<TopicDetailPageState>>{
    TopicDetailPageAction.didLoad: loadTopicVideos,
  });
}

TopicDetailPageState loadTopicVideos(
    TopicDetailPageState state, Action action) {
  TopicDetailPageState newState = state.clone();
  List<Video> videos = action.payload;
  newState.videos = videos;
  return newState;
}
