import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SearchPageState implements Cloneable<SearchPageState> {
  List<Video> results = [];
  int pageIndex = 1;
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override
  SearchPageState clone() {
    return SearchPageState()
      ..isLoading = isLoading
      ..results = results
      ..controller = controller
      ..pageIndex = pageIndex
      ..scrollController = scrollController;
  }
}

SearchPageState initState(Map<String, dynamic> map) {
  return SearchPageState();
}
