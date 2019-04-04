import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:dogetv_flutter/repository/movie.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<CategoryTabPageState> buildEffect() {
  return combineEffects(<Object, Effect<CategoryTabPageState>>{
    Lifecycle.initState: _init,
    CategoryTabPageAction.onFetch: _onFetch,
    CategoryTabPageAction.onUpdateQuery: _onUpdateQuery,
    CategoryTabPageAction.onLoadMore: _onLoadMore
  });
}

void _init(Action action, Context<CategoryTabPageState> ctx) async {
  APIs.getVideos(ctx.state.current).then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadAction(videos));
  });
}

void _onFetch(Action action, Context<CategoryTabPageState> ctx) async {
  Category category = action.payload;
  APIs.getVideos(category).then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadAction(videos));
  });
}

void _onLoadMore(Action action, Context<CategoryTabPageState> ctx) async {
  int index = ctx.state.pageIndex + 1;
  Category category = ctx.state.current;

  APIs.getVideos(category, pageIndex: index).then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadMoreAction(videos));
  });
}

void _onUpdateQuery(Action action, Context<CategoryTabPageState> ctx) async {
  APIs.getVideos(ctx.state.current, queryString: ctx.state.queryString)
      .then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadAction(videos));
  });
}
