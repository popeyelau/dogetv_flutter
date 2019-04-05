import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/search_page/search_item_component/action.dart';
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
                Hero(
                  tag: video.id,
                  child: CachedNetworkImage(
                      width: 100,
                      imageUrl: "http://v.popeye.vip" + video.cover,
                      fit: BoxFit.cover,
                      placeholder: (ctx, _) =>
                          Image.asset("assets/images/404@2x.png")),
                ),
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
                          text: "地区/上映: ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: "${video.area}/${video.year}",
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ])),
                      Text.rich(
                          TextSpan(
                              text: "演员: ",
                              style: TextStyle(fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: video.actor,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
                          maxLines: 2),
                    ],
                  ),
                ),
              ]),
        )),
  );
}
