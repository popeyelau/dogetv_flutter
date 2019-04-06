import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<CategoryTabPageState> buildEffect() {
  return combineEffects(<Object, Effect<CategoryTabPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    CategoryTabPageAction.onFetch: _onFetch,
    CategoryTabPageAction.onUpdateQuery: _onUpdateQuery,
    CategoryTabPageAction.onLoadMore: _onLoadMore,
  });
}

void _init(Action action, Context<CategoryTabPageState> ctx) async {
  APIs.getVideos(ctx.state.current).then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadAction(videos));
  });
}

void _dispose(Action action, Context<CategoryTabPageState> ctx) async {
  ctx.state.easyRefreshKey = null;
  ctx.state.headerKey = null;
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
  String queryString = ctx.state.queryString;

  APIs.getVideos(category, pageIndex: index, queryString: queryString)
      .then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadMoreAction(videos));
  });
}

void _onUpdateQuery(Action action, Context<CategoryTabPageState> ctx) async {
  APIs.getVideos(ctx.state.current, queryString: ctx.state.queryString)
      .then((videos) {
    ctx.dispatch(CategoryTabPageActionCreator.didLoadAction(videos));
  });
}
