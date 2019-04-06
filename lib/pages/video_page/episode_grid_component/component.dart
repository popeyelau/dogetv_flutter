import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/pages/video_page/episode_grid_component/effect.dart';
import 'package:dogetv_flutter/pages/video_page/episode_grid_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class EpisodesGridComponent extends Component<List<Episode>> {
  EpisodesGridComponent() : super(view: buildView, effect: buildEffect());
}
