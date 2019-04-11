import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

class TVPageState implements Cloneable<TVPageState> {
  List<TV> groups = [];
  bool isIPTV = true;

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
