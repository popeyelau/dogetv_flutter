import 'package:dogetv_flutter/pages/player/adapter.dart';
import 'package:dogetv_flutter/pages/player/effect.dart';
import 'package:dogetv_flutter/pages/player/reduder.dart';
import 'package:dogetv_flutter/pages/player/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class PlayerPage extends Page<PlayerPageState, Map<String, dynamic>> {
  PlayerPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
          initState: initState,
          dependencies: Dependencies<PlayerPageState>(
              adapter: PlayerListAdapter(),
              slots: <String, Dependent<PlayerPageState>>{}),
        );
}

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
