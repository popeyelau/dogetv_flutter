import 'package:dogetv_flutter/pages/player_page/page.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    TVGridItemAction.didSelect: didSelect,
  });
}

didSelect(Action action, Context ctx) async {
  action.payload["live"] = true;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return PlayerPage().buildPage(action.payload);
  }));
}
