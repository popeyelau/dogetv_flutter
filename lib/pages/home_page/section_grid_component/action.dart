import 'package:fish_redux/fish_redux.dart';

enum SectionGridAction { didSelect }

class SectionGridActionCreator {
  static Action didSelect(String videoId) {
    Map<String, dynamic> payload = {"videoId": videoId};
    return Action(SectionGridAction.didSelect, payload: payload);
  }
}
