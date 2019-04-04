import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/channel.dart';

class TVPageState implements Cloneable<TVPageState> {
  List<Channel> channels = [];

  @override
  TVPageState clone() {
    return TVPageState()..channels = channels;
  }
}

TVPageState initState(Map<String, dynamic> map) {
  return TVPageState();
}
