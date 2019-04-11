import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/channel.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Channel channel, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(TVGridItemActionCreator.didSelect(channel.url)),
    child: Card(
      elevation: 5.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: channel.icon.isNotEmpty,
              child: CachedNetworkImage(
                width: 48,
                fit: BoxFit.cover,
                imageUrl: channel.icon,
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  channel.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )),
          ]),
    ),
  );
}
