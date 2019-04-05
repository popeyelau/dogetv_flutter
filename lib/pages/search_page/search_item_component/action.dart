import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';

enum SearchItemAction { onSelect }

class SearchItemActionCreator {
  static Action onSelect(Video video) {
    Map<String, dynamic> payload = {"videoId": video.id};
    return Action(SearchItemAction.onSelect, payload: payload);
  }
}
