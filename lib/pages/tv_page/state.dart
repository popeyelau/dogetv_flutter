import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

class TVPageState implements Cloneable<TVPageState> {
  List<TV> groups = [];
  bool isIPTV = true;

  String get title {
    return isIPTV ? "联通IPTV" : "华文电视";
  }

  @override
  TVPageState clone() {
    return TVPageState()
      ..groups = groups
      ..isIPTV = isIPTV;
  }
}

TVPageState initState(Map<String, dynamic> map) {
  return TVPageState();
}
