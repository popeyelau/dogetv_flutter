import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

class VideoGridState extends Cloneable<VideoGridState> {
  List<Video> videos;

  @override
  VideoGridState clone() {
    return VideoGridState()..videos = videos;
  }
}

class VideoGridConnector extends ConnOp<CategoryTabPageState, VideoGridState> {
  @override
  VideoGridState get(CategoryTabPageState state) {
    VideoGridState gridState = VideoGridState();
    gridState.videos = state.vidoes;
    return gridState;
  }
}
