import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';

enum TopicItemAction { onSelect }

class TopicItemActionCreator {
  static Action onSelect(Topic topic) {
    Map<String, dynamic> payload = {"topic": topic};
    return Action(TopicItemAction.onSelect, payload: payload);
  }
}
