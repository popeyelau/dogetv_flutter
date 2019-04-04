import 'dart:math';

import 'package:dogetv_flutter/pages/video/component/section_header.dart';
import 'package:dogetv_flutter/pages/video/component/server_grid.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/video/component/episodes_grid.dart';
import 'package:dogetv_flutter/pages/video/component/video_header.dart';
import 'package:dogetv_flutter/pages/video/state.dart';

class VideoDetailListAdapter extends DynamicFlowAdapter<VideoPageState> {
  VideoDetailListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "header": VideoHeaderComponent(),
            "section-header": VideoSectionHeaderComponent(),
            "episodes": EpisodesGridComponent(),
            "servers": VideoServerGridComponent(),
          },
          connector: VideoDetailListConnector(),
        );
}

class VideoDetailListConnector extends ConnOp<VideoPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(VideoPageState state) {
    List<ItemBean> items = [];
    items.add(ItemBean("header", state.videoDetail.video));
    items.add(ItemBean("section-header", "线路"));
    List<int> servers =
        List.generate(min(state.videoDetail.video.source, 8), (item) => item);
    items.add(ItemBean("servers", servers));
    items.add(ItemBean("section-header", "分集"));
    items.add(ItemBean("episodes", state.videoDetail.episodes));
    return items;
  }

  @override
  void set(VideoPageState state, List<ItemBean> subState) {}
}
