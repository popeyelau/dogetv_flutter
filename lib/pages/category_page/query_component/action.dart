import 'package:dogetv_flutter/models/query.dart';
import 'package:fish_redux/fish_redux.dart';

enum QueryPanelAction { onSelected }

class QueryPanelActionCreator {
  static Action onSelected({String type, int index}) {
    Map<String, dynamic> payload = {"type": type, "index": index};
    return Action(QueryPanelAction.onSelected, payload: payload);
  }
}
