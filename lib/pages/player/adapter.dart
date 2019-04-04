import 'package:dogetv_flutter/pages/player/component/player_episode_grid.dart';
import 'package:dogetv_flutter/pages/player/component/player_view.dart';
import 'package:dogetv_flutter/pages/player/state.dart';
import 'package:dogetv_flutter/pages/video/component/section_header.dart';
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
    if (state.episodes.length > 0) {
      items.add(ItemBean("header", "分集"));
      items.add(ItemBean("episodes", state.episodes));
    }
    return items;
  }

  @override
  void set(PlayerPageState state, List<ItemBean> subState) {}
}
