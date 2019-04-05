import 'package:dogetv_flutter/pages/search_page/search_item_component/component.dart';
import 'package:dogetv_flutter/pages/search_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class SearchResultListAdapter extends DynamicFlowAdapter<SearchPageState> {
  SearchResultListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "video": SearchItemComponent(),
          },
          connector: SearchResultListConnector(),
        );
}

class SearchResultListConnector
    extends ConnOp<SearchPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(SearchPageState state) {
    return state.results.map((video) => ItemBean("video", video)).toList();
  }

  @override
  void set(SearchPageState state, List<ItemBean> subState) {}
}
