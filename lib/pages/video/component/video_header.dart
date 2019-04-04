import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/models/video.dart';

class VideoHeaderComponent extends Component<Video> {
  VideoHeaderComponent() : super(view: buildView);
}

Widget buildView(Video video, dispatch, ViewService viewService) {
  return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            child: Image(
              height: 200,
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(video.cover.startsWith("http")
                  ? video.cover
                  : "http://v.popeye.vip" + video.cover),
            ),
            tag: video.id,
          ),
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
                Text.rich(TextSpan(
                    text: "导演: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: video.director,
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
                Text.rich(TextSpan(
                    text: "类型: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: video.tag,
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
                Text.rich(TextSpan(
                    text: "地区: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: video.area,
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
                Text.rich(TextSpan(
                    text: "上映: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: video.year,
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
                Text.rich(
                    TextSpan(
                        text: "演员: ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: video.actor,
                              style: TextStyle(fontWeight: FontWeight.normal))
                        ]),
                    maxLines: 3),
                Text.rich(
                  TextSpan(
                      text: "简介: ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: video.desc,
                            style: TextStyle(fontWeight: FontWeight.normal))
                      ]),
                  maxLines: 5,
                ),
              ],
            ),
          )
        ],
      ));
}
