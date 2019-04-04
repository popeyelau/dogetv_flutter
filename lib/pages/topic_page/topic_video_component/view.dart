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
            elevation: 5.0,
            child: Hero(
              child: CachedNetworkImage(
                imageUrl: "http://v.popeye.vip" + video.cover,
                fit: BoxFit.cover,
                placeholder: (ctx, _) =>
                    Image.asset("assets/images/404@2x.png"),
              ),
              tag: video.id,
            ),
          ),
        ),
        Text(
          video.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    ),
  );
}
