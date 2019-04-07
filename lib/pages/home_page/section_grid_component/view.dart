import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/home_page/section_grid_component/action.dart';
import 'package:dogetv_flutter/widgets/video_card/widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(List<Video> state, dispatch, ViewService viewService) {
  return GridView.builder(
    padding: EdgeInsets.all(8.0),
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: state.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.62,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0),
    itemBuilder: (BuildContext context, int index) {
      final video = state[index];
      return GestureDetector(
        onTap: () {
          dispatch(VideoSectionActionCreator.onSelect(video.id));
        },
        child: VideoCard(video: video, heroEnable: false),
      );
    },
  );
}
