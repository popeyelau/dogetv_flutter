import 'package:dogetv_flutter/pages/search_page/action.dart';
import 'package:dogetv_flutter/pages/search_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';

Effect<SearchPageState> buildEffect() {
  return combineEffects(<Object, Effect<SearchPageState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    SearchPageAction.onFetch: _onFetch,
    SearchPageAction.onLoadMore: _onLoadMore
  });
}

void _init(Action action, Context<SearchPageState> ctx) async {
  var controller = ctx.state.scrollController;
  controller.addListener(() {
    if (!ctx.state.isLoading &&
        controller.position.pixels == controller.position.maxScrollExtent) {
      print("load more ...........");
      ctx.dispatch(SearchPageActionCreator.onLoadMoreAction());
    }
  });
}

void _dispose(Action action, Context<SearchPageState> ctx) async {
  ctx.state.controller.dispose();
  ctx.state.scrollController.dispose();
}

void _onLoadMore(Action action, Context<SearchPageState> ctx) async {
  APIs.search(ctx.state.controller.text, pageIndex: ctx.state.pageIndex + 1)
      .then((results) {
    ctx.dispatch(SearchPageActionCreator.didLoadMoreAction(results));
  });
}

void _onFetch(Action action, Context<SearchPageState> ctx) async {
  String keywords = ctx.state.controller.text;
  if (keywords.isEmpty) {
    return;
  }
  APIs.search(ctx.state.controller.text).then((results) {
    ctx.dispatch(SearchPageActionCreator.didLoadAction(results));
  });
}
