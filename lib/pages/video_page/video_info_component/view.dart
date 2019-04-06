import 'package:dogetv_flutter/widgets/text_intro_widget/widget.dart';
import 'package:dogetv_flutter/widgets/video_cover/widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/models/video.dart';

Widget buildView(Video video, dispatch, ViewService viewService) {
  return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VideoCover(path: video.cover, height: 200, heroTag: video.id),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  video.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextIntro(label: "导演", text: video.director),
                TextIntro(label: "类型", text: video.tag),
                TextIntro(label: "地区", text: video.area),
                TextIntro(label: "上映", text: video.year),
                TextIntro(label: "演员", text: video.actor, maxLines: 4),
              ],
            ),
          )
        ],
      ));
}
