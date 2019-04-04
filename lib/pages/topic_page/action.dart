import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video.dart';

enum TopicDetailPageAction {
  onLoad,
  onFetch,
  didLoad,
}

class TopicDetailPageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(TopicDetailPageAction.onLoad, payload: isLoading);
  }

  static Action didLoadAction(List<Video> videos) {
    return Action(TopicDetailPageAction.didLoad, payload: videos);
  }

  static Action onFetchAction() {
    return Action(TopicDetailPageAction.onFetch);
  }
}
