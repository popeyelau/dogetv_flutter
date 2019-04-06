import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/state.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/component.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
