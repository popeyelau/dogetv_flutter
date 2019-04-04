import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<QueryPanelState> buildReducer() {
  return asReducer(<Object, Reducer<QueryPanelState>>{
    QueryPanelAction.onSelected: onSelected,
  });
}

QueryPanelState onSelected(QueryPanelState state, Action action) {
  String type = action.payload["type"];
  int index = action.payload["index"];
  QueryPanelState newState = state.clone();

  QueryOptionSet optionSet =
      newState.optionSets.firstWhere((i) => i.title == type);
  optionSet.options.forEach((i) => i.isSelected = false);
  optionSet.options[index].isSelected = true;
  return newState;
}
