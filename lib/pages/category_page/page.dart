import 'package:dogetv_flutter/pages/category_page/effect.dart';
import 'package:dogetv_flutter/pages/category_page/reducer.dart';
import 'package:dogetv_flutter/pages/category_page/state.dart';
import 'package:dogetv_flutter/pages/category_page/view.dart';
import 'package:fish_redux/fish_redux.dart';

class CategoryPage extends Page<CategoryPageState, Map<String, dynamic>> {
  CategoryPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<CategoryPageState>(
              slots: <String, Dependent<CategoryPageState>>{}),
        );
}
