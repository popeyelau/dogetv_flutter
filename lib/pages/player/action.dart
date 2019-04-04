import 'package:dogetv_flutter/models/episode.dart';
import 'package:fish_redux/fish_redux.dart';

enum PlayerPageAction { onChangeEpisode }

class PlayerPageActionCreator {
  static Action onChangeEpisodeAction(Episode episode) {
    return Action(PlayerPageAction.onChangeEpisode, payload: episode);
  }
}
