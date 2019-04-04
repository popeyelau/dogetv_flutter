import 'package:dogetv_flutter/models/video.dart';

import 'state.dart';
import '../grid_item_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class VideoGridListAdapter extends DynamicFlowAdapter<VideoGridState> {
  VideoGridListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "video": VideoGridItemComponent(),
          },
          connector: VideoGridListConnector(),
        );
}

class VideoGridListConnector extends ConnOp<VideoGridState, List<ItemBean>> {
  @override
  List<ItemBean> get(VideoGridState state) {
    List<Video> videos = state.videos;
    return videos.map((video) => ItemBean("video", video)).toList();
  }

  @override
  void set(VideoGridState state, List<ItemBean> subState) {}
}
