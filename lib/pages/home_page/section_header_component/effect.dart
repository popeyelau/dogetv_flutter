import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/page.dart';
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
  String type = action.payload;
  if (type == "精选专题") {
    Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
      return TopicsPage().buildPage(null);
    }));
    return;
  }
  int tabIndex = CategoryTitles.indexOf(type);
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return CategoryPage().buildPage({"index": tabIndex == -1 ? 0 : tabIndex});
  }));
}
