import 'package:dogetv_flutter/pages/home_page/section_grid_component/component.dart';
import 'package:dogetv_flutter/pages/home_page/section_header_component/component.dart';
import 'package:dogetv_flutter/pages/home_page/section_topics_component/component.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/home_page/state.dart';

class MovieGroupAdapter extends DynamicFlowAdapter<HomePageState> {
  MovieGroupAdapter()
      : super(
          pool: <String, Component<Object>>{
            "topic": TopicHorizontalComponent(),
            "header": SectionHeaderComponent(),
            "grid": SectionGridComponent(),
          },
          connector: HomeMovieListConnector(),
        );
}

class HomeMovieListConnector extends ConnOp<HomePageState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomePageState state) {
    List<ItemBean> items = [];
    if (!state.isDataReady) {
      return items;
    }

    items.add(ItemBean("header", "精选专题"));
    items.add(ItemBean("topic", state.home.topics));
    for (var section in state.home.sections) {
      items.add(ItemBean("header", section.title));
      items.add(ItemBean("grid", section.items.take(9).toList()));
    }

    return items;
  }

  @override
  void set(HomePageState state, List<ItemBean> subState) {
    super.set(state, subState);
  }
}
