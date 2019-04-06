import 'package:dogetv_flutter/models/episode.dart';
import 'package:fish_redux/fish_redux.dart';

enum EpisodeItemAction { onPlay }

class EpisodeItemActionCreator {
  static Action onPlay(Episode episode, List<Episode> episodes) {
    Map<String, dynamic> payload = {"episode": episode, "episodes": episodes};
    return Action(EpisodeItemAction.onPlay, payload: payload);
  }
}
