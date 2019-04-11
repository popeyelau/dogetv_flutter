import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:dogetv_flutter/pages/home_page/section_topics_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(List<Topic> state, dispatch, ViewService viewService) {
  return Container(
    height: 150,
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.length,
      itemBuilder: (BuildContext context, int index) {
        final topic = state[index];
        return GestureDetector(
          onTap: () => dispatch(SectionTopicsActionCreator.onSelect(topic)),
          child: Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "http://v.popeye.vip" + topic.cover,
                          errorListener: () {}),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: Text(
                    topic.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
