import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:dogetv_flutter/pages/player_page/player_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class PlayerViewComponent extends Component<PlayerPageState> {
  PlayerViewComponent() : super(view: buildView);
}
