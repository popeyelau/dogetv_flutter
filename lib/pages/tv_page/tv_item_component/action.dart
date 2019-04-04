import 'package:fish_redux/fish_redux.dart';

enum TVGridItemAction { didSelect }

class TVGridItemActionCreator {
  static Action didSelect(String url) {
    Map<String, dynamic> payload = {"url": url};
    return Action(TVGridItemAction.didSelect, payload: payload);
  }
}
