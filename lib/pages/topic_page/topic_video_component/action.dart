import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';

enum TopicVideoItemAction { onSelect }

class TopicVideoItemActionCreator {
  static Action onSelect(Video video) {
    Map<String, dynamic> payload = {"videoId": video.id};
    return Action(TopicVideoItemAction.onSelect, payload: payload);
  }
}
