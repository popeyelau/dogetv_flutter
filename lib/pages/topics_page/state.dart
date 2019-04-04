import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicsPageState implements Cloneable<TopicsPageState> {
  List<Topic> topics = [];

  @override
  TopicsPageState clone() {
    return TopicsPageState()..topics = topics;
  }
}

TopicsPageState initState(Map<String, dynamic> map) {
  return TopicsPageState();
}
