import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/category_page/grid_item_component/action.dart';
import 'package:dogetv_flutter/widgets/video_card/widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Video video, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(CategoryVideoItemActionCreator.onSelect(video)),
    child: Container(
      child: VideoCard(video: video),
    ),
  );
}
