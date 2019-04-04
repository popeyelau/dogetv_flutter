import 'package:dogetv_flutter/pages/topic_page/page.dart';
import 'package:dogetv_flutter/pages/topics_page/topic_item_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    TopicItemAction.onSelect: onSelect,
  });
}

onSelect(Action action, Context ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TopicDetailPage().buildPage(action.payload);
  }));
}
