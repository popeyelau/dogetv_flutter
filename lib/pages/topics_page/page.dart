import 'package:dogetv_flutter/pages/topics_page/effect.dart';
import 'package:dogetv_flutter/pages/topics_page/state.dart';
import 'package:dogetv_flutter/pages/topics_page/reducer.dart';
import 'package:dogetv_flutter/pages/topics_page/adapter.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TopicsPage extends Page<TopicsPageState, Map<String, dynamic>> {
  TopicsPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<TopicsPageState>(
              adapter: TopicListAdapter(),
              slots: <String, Dependent<TopicsPageState>>{}),
        );
}

Widget buildView(
    TopicsPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("精选专题"),
    ),
    body: Container(
        child: ListView.builder(
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    )),
  );
}
