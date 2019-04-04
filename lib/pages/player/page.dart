import 'package:dogetv_flutter/pages/player/adapter.dart';
import 'package:dogetv_flutter/pages/player/effect.dart';
import 'package:dogetv_flutter/pages/player/reduder.dart';
import 'package:dogetv_flutter/pages/player/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

/*
class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}*/

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
            child: ListView.builder(
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
        )),
      );
    },
  );
}
