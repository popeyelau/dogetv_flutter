import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/effect.dart';
import 'package:dogetv_flutter/pages/category_page/reducer.dart';
import 'package:dogetv_flutter/pages/category_page/state.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/component.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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

Widget buildView(
    CategoryPageState state, dynamic dispatch, ViewService viewService) {
  List<Tab> tabs = state.categories.map((item) => Tab(text: item)).toList();
  List<Widget> tabContents = Category.values
      .map((category) =>
          CategoryTabPageComponent().buildPage({"category": category}))
      .toList();

  return DefaultTabController(
    length: tabs.length,
    initialIndex: state.initialIndex,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("影视库"),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: false,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        children: tabContents,
      ),
    ),
  );
}
