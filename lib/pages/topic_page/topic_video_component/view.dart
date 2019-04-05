import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/topic_page/topic_video_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Video video, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(TopicVideoItemActionCreator.onSelect(video)),
    child: Container(
      child: Column(children: <Widget>[
        Expanded(
          child: Card(
            margin: EdgeInsets.all(0),
            elevation: 5,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "http://v.popeye.vip" + video.cover,
                  fit: BoxFit.fitWidth,
                  placeholder: (ctx, _) =>
                      Image.asset("assets/images/404@2x.png"),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.black.withAlpha(60),
                      child: Text(
                        video.state,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          video.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    ),
  );
}
