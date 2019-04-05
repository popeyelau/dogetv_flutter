import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SearchPageState implements Cloneable<SearchPageState> {
  List<Video> results = [];
  int pageIndex = 1;
  TextEditingController controller = TextEditingController();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshFooterState> headerKey = GlobalKey<RefreshFooterState>();
  bool isLoading = false;
  @override
  SearchPageState clone() {
    return SearchPageState()
      ..isLoading = isLoading
      ..results = results
      ..controller = controller
      ..pageIndex = pageIndex
      ..easyRefreshKey = easyRefreshKey
      ..headerKey = headerKey;
  }
}

SearchPageState initState(Map<String, dynamic> map) {
  return SearchPageState();
}
