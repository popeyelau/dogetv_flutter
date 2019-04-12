import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class CategoryTabPageState implements Cloneable<CategoryTabPageState> {
  CategoryVideo data;
  Category current = Category.values.first;
  String queryString = "-Shot";
  bool isLoading = false;
  int pageIndex = 1;
  ScrollController controller = ScrollController();

  @override
  CategoryTabPageState clone() {
    return CategoryTabPageState()
      ..data = data
      ..current = current
      ..queryString = queryString
      ..isLoading = isLoading
      ..pageIndex = pageIndex
      ..controller = controller;
  }

  List<Video> get vidoes {
    return data?.items ?? [];
  }

  List<QueryOptionSet> get querys {
    return data?.query ?? [];
  }
}

CategoryTabPageState initState(Map<String, dynamic> map) {
  return CategoryTabPageState()
    ..current = map["category"]
    ..isLoading = true
    ..pageIndex = 1;
}
