import 'package:dogetv_flutter/pages/topics_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
