import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/home_page/section_grid_component/action.dart';
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
        childAspectRatio: 9 / 14,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 2.0),
    itemBuilder: (BuildContext context, int index) {
      final video = state[index];
      return GestureDetector(
        onTap: () => dispatch(SectionGridActionCreator.didSelect(video.id)),
        child: Container(
          child: Column(children: <Widget>[
            Expanded(
              child: Card(
                elevation: 5.0,
                child: Hero(
                  child: Image(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                        "http://v.popeye.vip" + video.cover),
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
    },
  );
}
