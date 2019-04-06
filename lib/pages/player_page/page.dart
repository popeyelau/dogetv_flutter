import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:dogetv_flutter/pages/player_page/reducer.dart';
import 'package:dogetv_flutter/pages/player_page/effect.dart';
import 'package:dogetv_flutter/pages/player_page/adapter.dart';
import 'package:dogetv_flutter/pages/player_page/view.dart';
import 'package:fish_redux/fish_redux.dart';

class PlayerPage extends Page<PlayerPageState, Map<String, dynamic>> {
  PlayerPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<PlayerPageState>(
              adapter: PlayerListAdapter(),
              slots: <String, Dependent<PlayerPageState>>{}),
        );
}
