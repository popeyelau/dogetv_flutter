import 'package:dogetv_flutter/models/video_detail.dart';
import 'package:dogetv_flutter/pages/topic_page/topic_video_component/action.dart';
import 'package:dogetv_flutter/pages/video/page.dart';
import 'package:dogetv_flutter/repository/movie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    TopicVideoItemAction.onSelect: onSelect,
  });
}

onSelect(Action action, Context ctx) async {
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
