import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';

enum SectionTopicsAction { onSelect }

class SectionTopicsActionCreator {
  static Action onSelect(Topic topic) {
    Map<String, dynamic> payload = {"topic": topic};
    return Action(SectionTopicsAction.onSelect, payload: payload);
  }
}
