import 'package:dogetv_flutter/pages/topics_page/state.dart';
import 'package:dogetv_flutter/pages/topics_page/topic_item_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicListAdapter extends DynamicFlowAdapter<TopicsPageState> {
  TopicListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "topic": TopicItemComponent(),
          },
          connector: TopicListConnector(),
        );
}

class TopicListConnector extends ConnOp<TopicsPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(TopicsPageState state) {
    return state.topics.map((topic) => ItemBean("topic", topic)).toList();
  }

  @override
  void set(TopicsPageState state, List<ItemBean> subState) {}
}
