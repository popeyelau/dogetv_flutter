import 'package:fish_redux/fish_redux.dart';

enum VideoSectionAction { onSelect }

class VideoSectionActionCreator {
  static Action onSelect(String videoId) {
    return Action(VideoSectionAction.onSelect, payload: videoId);
  }
}
