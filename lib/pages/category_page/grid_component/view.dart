import 'package:dogetv_flutter/pages/category_page/grid_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(VideoGridState state, dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return SliverPadding(
    padding: EdgeInsets.all(8),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate(adapter.itemBuilder,
          childCount: adapter.itemCount),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.62,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 4.0),
    ),
  );
}
