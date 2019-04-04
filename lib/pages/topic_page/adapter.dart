import 'package:dogetv_flutter/pages/topic_page/state.dart';
import 'package:dogetv_flutter/pages/topic_page/topic_video_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicVideoListAdapter extends DynamicFlowAdapter<TopicDetailPageState> {
  TopicVideoListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "video": TopicVideoItemComponent(),
          },
          connector: TopicVideoListConnector(),
        );
}

class TopicVideoListConnector
    extends ConnOp<TopicDetailPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(TopicDetailPageState state) {
    return state.videos.map((video) => ItemBean("video", video)).toList();
  }

  @override
  void set(TopicDetailPageState state, List<ItemBean> subState) {}
}
