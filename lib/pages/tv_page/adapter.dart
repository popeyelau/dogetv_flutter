import 'package:dogetv_flutter/pages/tv_page/state.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class TVListAdapter extends DynamicFlowAdapter<TVPageState> {
  TVListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "channel": TVItemComponent(),
          },
          connector: TVListConnector(),
        );
}

class TVListConnector extends ConnOp<TVPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(TVPageState state) {
    return state.channels
        .map((channel) => ItemBean("channel", channel))
        .toList();
  }

  @override
  void set(TVPageState state, List<ItemBean> subState) {}
}
