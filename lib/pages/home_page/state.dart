import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePageState implements Cloneable<HomePageState> {
  Home home = Home();
  bool isLoading = false;

  final GlobalKey<EasyRefreshState> easyRefreshKey =
      GlobalKey<EasyRefreshState>();
  final GlobalKey<RefreshHeaderState> headerKey =
      GlobalKey<RefreshHeaderState>();

  @override
  HomePageState clone() {
    return HomePageState()
      ..home = home
      ..isLoading = isLoading;
  }

  bool get isDataReady {
    return home.topics.isNotEmpty && home.sections.isNotEmpty;
  }
}

HomePageState initState(Map<String, dynamic> map) {
  return HomePageState()..isLoading = true;
}
