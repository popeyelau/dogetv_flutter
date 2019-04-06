import 'dart:math';
import 'package:dogetv_flutter/pages/video_page/episode_grid_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/resource_grid_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/section_header_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/state.dart';
import 'package:dogetv_flutter/pages/video_page/video_info_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

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
    items.add(
        ItemBean("section-header", {"title": "线路", "subTitle": "线路画质从高到低"}));
    List<int> servers =
        List.generate(min(state.videoDetail.video.source, 8), (item) => item);
    items.add(ItemBean("servers", servers));
    items.add(ItemBean("section-header", {"title": "分集", "subTitle": null}));
    items.add(ItemBean("episodes", state.videoDetail.episodes));
    return items;
  }

  @override
  void set(VideoPageState state, List<ItemBean> subState) {}
}
