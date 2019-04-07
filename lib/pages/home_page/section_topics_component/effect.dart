import 'package:dogetv_flutter/pages/home_page/section_topics_component/action.dart';
import 'package:dogetv_flutter/pages/topic_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    SectionTopicsAction.onSelect: onSelect,
  });
}

onSelect(Action action, Context ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TopicDetailPage().buildPage(action.payload);
  }));
}
