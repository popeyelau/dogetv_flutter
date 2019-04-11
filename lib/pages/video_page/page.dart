import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/video_page/adapter.dart';
import 'package:dogetv_flutter/pages/video_page/effect.dart';
import 'package:dogetv_flutter/pages/video_page/reducer.dart';
import 'package:dogetv_flutter/pages/video_page/state.dart';

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
      title: Text(state.videoDetail.video.info.name),
    ),
    body: Container(
        child: ListView.builder(
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    )),
  );
}
