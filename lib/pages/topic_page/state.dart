import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video.dart';

class TopicDetailPageState implements Cloneable<TopicDetailPageState> {
  List<Video> videos = [];
  Topic topic;

  @override
  TopicDetailPageState clone() {
    return TopicDetailPageState()
      ..videos = videos
      ..topic = topic;
  }
}

TopicDetailPageState initState(Map<String, dynamic> map) {
  TopicDetailPageState state = TopicDetailPageState();
  state.topic = map["topic"];
  return state;
}
