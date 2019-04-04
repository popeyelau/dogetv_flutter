import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';

enum CategoryVideoItemAction { onSelect }

class CategoryVideoItemActionCreator {
  static Action onSelect(Video video) {
    Map<String, dynamic> payload = {"videoId": video.id};
    return Action(CategoryVideoItemAction.onSelect, payload: payload);
  }
}
