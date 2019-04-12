import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:flutter/material.dart';

class HomePageState implements Cloneable<HomePageState> {
  Home home = Home();
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
