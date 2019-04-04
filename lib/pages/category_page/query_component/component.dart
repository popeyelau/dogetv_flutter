import 'package:dogetv_flutter/pages/category_page/query_component/reducer.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class QueryPanelComponent extends Component<QueryPanelState> {
  QueryPanelComponent() : super(view: buildView, reducer: buildReducer());
}
