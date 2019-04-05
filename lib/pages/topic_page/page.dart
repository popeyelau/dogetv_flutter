import 'package:dogetv_flutter/pages/topic_page/adapter.dart';
import 'package:dogetv_flutter/pages/topic_page/effect.dart';
import 'package:dogetv_flutter/pages/topic_page/reducer.dart';
import 'package:dogetv_flutter/pages/topic_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TopicDetailPage extends Page<TopicDetailPageState, Map<String, dynamic>> {
  TopicDetailPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<TopicDetailPageState>(
              adapter: TopicVideoListAdapter(),
              slots: <String, Dependent<TopicDetailPageState>>{}),
        );
}

Widget buildView(
    TopicDetailPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(state.topic.title),
    ),
    body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.62,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0),
        )),
  );
}
