import 'package:dogetv_flutter/pages/home_page/section_header_component/action.dart';
import 'package:dogetv_flutter/pages/topics_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    SectionHeaderAction.onShowMore: onShowMore,
  });
}

onShowMore(Action action, Context ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TopicsPage().buildPage(null);
  }));
}
