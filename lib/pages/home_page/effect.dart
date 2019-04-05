import 'package:dogetv_flutter/models/video_detail.dart';
import 'package:dogetv_flutter/pages/category_page/page.dart';
import 'package:dogetv_flutter/pages/search_page/page.dart';
import 'package:dogetv_flutter/pages/topic_page/page.dart';
import 'package:dogetv_flutter/pages/video/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/home_page/action.dart';
import 'package:dogetv_flutter/pages/home_page/state.dart';
import 'package:dogetv_flutter/pages/tv_page/page.dart';
import 'package:dogetv_flutter/repository/movie.dart';

Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    Lifecycle.initState: _init,
    HomePageAction.onFetch: _onFetch,
    HomePageAction.onShowTV: _onShowTV,
    HomePageAction.onShowTopic: _onShowTopic,
    HomePageAction.onShowLibrary: _onShowLibrary,
    HomePageAction.onShowVideo: _onShowVideo,
    HomePageAction.onShowSearch: _onShowSearch
  });
}

void _init(Action action, Context<HomePageState> ctx) async {
  APIs.getMovies().then((movies) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(movies));
  });
}

void _onFetch(Action action, Context<HomePageState> ctx) async {
  APIs.getMovies().then((movies) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(movies));
  });
}

void _onShowTV(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TVPage().buildPage(null);
  }));
}

void _onShowLibrary(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return CategoryPage().buildPage({"index": 0});
  }));
}

void _onShowTopic(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TopicDetailPage().buildPage(action.payload);
  }));
}

void _onShowVideo(Action action, Context<HomePageState> ctx) async {
  String videoId = action.payload;
  VideoDetail videoDetail = await APIs.getVideo(videoId);
  Map<String, dynamic> payload = {
    "videoId": videoId,
    "videoDetail": videoDetail
  };
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return VideoPage().buildPage(payload);
  }));
}

void _onShowSearch(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return SearchPage().buildPage(action.payload);
  }));
}
