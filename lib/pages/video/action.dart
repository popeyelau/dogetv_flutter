import 'package:dogetv_flutter/models/episode.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video_detail.dart';

enum VideoPageAction {
  onLoad,
  onFetch,
  didLoad,
  onUpdateSource,
  didUpdateSource,
}

class VideoPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(VideoPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(VideoDetail videoDetail) {
    return Action(VideoPageAction.didLoad, payload: videoDetail);
  }

  static Action onFetchAction() {
    return Action(VideoPageAction.onFetch);
  }

  static Action onUpdateSourceAction(String source) {
    return Action(VideoPageAction.onUpdateSource, payload: source);
  }

  static Action didUpdateSourceAction(String source, List<Episode> episodes) {
    return Action(VideoPageAction.didUpdateSource,
        payload: {"source": source, "episodes": episodes});
  }
}
