import 'package:dogetv_flutter/pages/category_page/grid_component/component.dart';
import 'package:dogetv_flutter/pages/category_page/grid_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/component.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/view.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/reducer.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/effect.dart';
import 'package:fish_redux/fish_redux.dart';

class CategoryTabPageComponent
    extends Page<CategoryTabPageState, Map<String, dynamic>> {
  CategoryTabPageComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<CategoryTabPageState>(slots: {
            "query-panel": QueryPanelConnector() + QueryPanelComponent(),
            "video-grid": VideoGridConnector() + VideoGridComponent(),
          }),
        );
}
