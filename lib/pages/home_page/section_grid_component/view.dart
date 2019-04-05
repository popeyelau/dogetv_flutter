import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/home_page/action.dart';
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
        childAspectRatio: 0.62,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 4.0),
    itemBuilder: (BuildContext context, int index) {
      final video = state[index];
      return GestureDetector(
        onTap: () {
          dispatch(HomePageActionCreator.onShowVideoAction(video.id));
        },
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
      );
    },
  );
}
