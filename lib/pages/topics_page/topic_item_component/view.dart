import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:dogetv_flutter/pages/topics_page/topic_item_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Topic topic, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(TopicItemActionCreator.onSelect(topic)),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            "http://v.popeye.vip" + topic.cover,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(color: Colors.grey.shade500.withOpacity(0.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              "http://v.popeye.vip" + topic.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "#" + topic.title + "#",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    topic.desc,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    ),
  );
}
