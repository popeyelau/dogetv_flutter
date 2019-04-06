import 'package:dogetv_flutter/pages/player_page/episode_grid_component/component.dart';
import 'package:dogetv_flutter/pages/player_page/player_component/component.dart';
import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:dogetv_flutter/pages/video_page/section_header_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class PlayerListAdapter extends DynamicFlowAdapter<PlayerPageState> {
  PlayerListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "player": PlayerViewComponent(),
            "header": VideoSectionHeaderComponent(),
            "episodes": PlayerEpisodesGridComponent(),
          },
          connector: PlayerListConnector(),
        );
}

class PlayerListConnector extends ConnOp<PlayerPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(PlayerPageState state) {
    List<ItemBean> items = [];
    items.add(ItemBean("player", state));
    if (state.episodes != null && state.episodes.length > 0) {
      items.add(ItemBean("header", {"title": "分集", "subTitle": null}));
      items.add(ItemBean("episodes", state.episodes));
    }
    return items;
  }

  @override
  void set(PlayerPageState state, List<ItemBean> subState) {}
}
