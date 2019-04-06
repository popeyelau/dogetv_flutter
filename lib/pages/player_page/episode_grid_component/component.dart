import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/pages/player_page/episode_grid_component/view.dart';

class PlayerEpisodesGridComponent extends Component<List<Episode>> {
  PlayerEpisodesGridComponent() : super(view: buildView);
}
