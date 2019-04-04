import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/video/adapter.dart';
import 'package:dogetv_flutter/pages/video/effect.dart';
import 'package:dogetv_flutter/pages/video/reducer.dart';
import 'package:dogetv_flutter/pages/video/state.dart';

class VideoPage extends Page<VideoPageState, Map<String, dynamic>> {
  VideoPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<VideoPageState>(
              adapter: VideoDetailListAdapter(),
              slots: <String, Dependent<VideoPageState>>{}),
        );
}

Widget buildView(
    VideoPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(state.videoDetail.video.name),
    ),
    body: Container(
        child: ListView.builder(
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    )),
  );
}
