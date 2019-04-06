import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/search_page/search_item_component/action.dart';
import 'package:dogetv_flutter/widgets/text_intro_widget/widget.dart';
import 'package:dogetv_flutter/widgets/video_cover/widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Video video, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(SearchItemActionCreator.onSelect(video)),
    child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                VideoCover(path: video.cover, width: 100, heroTag: video.id),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        video.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      TextIntro(label: "导演", text: video.director),
                      TextIntro(label: "类型", text: video.tag),
                      TextIntro(
                          label: "地区/上映", text: "${video.area}/${video.year}"),
                      TextIntro(label: "演员", text: video.actor, maxLines: 2),
                    ],
                  ),
                ),
              ]),
        )),
  );
}
