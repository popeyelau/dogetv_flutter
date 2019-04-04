import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video_detail.dart';

class VideoPageState implements Cloneable<VideoPageState> {
  VideoDetail videoDetail = VideoDetail();
  String videoId;
  String source = "";

  @override
  VideoPageState clone() {
    return VideoPageState()
      ..videoDetail = videoDetail
      ..videoId = videoId;
  }
}

VideoPageState initState(Map<String, dynamic> map) {
  String videoId = map["videoId"];
  VideoDetail videoDetail = map["videoDetail"];
  VideoPageState state = VideoPageState();
  state.videoId = videoId;
  state.videoDetail = videoDetail;
  return state;
}
