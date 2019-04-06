import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(
    PlayerPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();

  return OrientationBuilder(
    builder: (context, orientation) {
      return Scaffold(
        body: Container(
            color: Colors.black,
            child: ListView.builder(
              itemBuilder: listAdapter.itemBuilder,
              itemCount: listAdapter.itemCount,
            )),
      );
    },
  );
}
