import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

class QueryPanelState extends Cloneable<QueryPanelState> {
  List<QueryOptionSet> optionSets;

  @override
  QueryPanelState clone() {
    return QueryPanelState()..optionSets = optionSets;
  }
}

class QueryPanelConnector
    extends ConnOp<CategoryTabPageState, QueryPanelState> {
  @override
  QueryPanelState get(CategoryTabPageState state) {
    QueryPanelState queryPanelState = QueryPanelState();
    queryPanelState.optionSets = state.querys;
    return queryPanelState;
  }

  @override
  void set(CategoryTabPageState state, QueryPanelState subState) {
    state.data.query = subState.optionSets;

    QueryOptionSet type =
        subState.optionSets.firstWhere((i) => i.title == "类型");
    String selectedType = type?.options?.firstWhere((i) => i.isSelected)?.key;
    String queryString = "";

    if (selectedType.isNotEmpty) {
      queryString += "/$selectedType";
    }
    String keys = subState.optionSets
        .where((i) => i.title != "类型")
        .map((v) => v.options)
        .expand((f) => f)
        .where((i) => i.isSelected && i.key.isNotEmpty)
        .map((i) => i.key)
        .toList()
        .join("-");
    if (keys.isNotEmpty && keys != "-") {
      queryString += "-$keys";
    }
    state.pageIndex = 1;
    state.queryString = queryString;
  }
}
