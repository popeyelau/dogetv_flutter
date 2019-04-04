import 'package:dogetv_flutter/pages/home_page/section_grid_component/action.dart';
import 'package:dogetv_flutter/models/video_detail.dart';
import 'package:dogetv_flutter/pages/video/page.dart';
import 'package:dogetv_flutter/repository/movie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    SectionGridAction.didSelect: didSelect,
  });
}

didSelect(Action action, Context ctx) async {
  String videoId = action.payload["videoId"];
  VideoDetail videoDetail = await APIs.getVideo(videoId);
  Map<String, dynamic> payload = {
    "videoId": videoId,
    "videoDetail": videoDetail
  };
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return VideoPage().buildPage(payload);
  }));
}
