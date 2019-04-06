import 'package:dogetv_flutter/pages/home_page/action.dart';
import 'package:dogetv_flutter/pages/home_page/adapter.dart';
import 'package:dogetv_flutter/pages/home_page/state.dart';
import 'package:dogetv_flutter/pages/home_page/effect.dart';
import 'package:dogetv_flutter/pages/home_page/reducer.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends Page<HomePageState, Map<String, dynamic>> {
  HomePage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          onError: onMessageError,
          dependencies: Dependencies<HomePageState>(
              adapter: MovieGroupAdapter(),
              slots: <String, Dependent<HomePageState>>{}),
        );
}

bool onMessageError(Exception e, Context<HomePageState> ctx) {
  print(e.toString());
  return false;
}

Widget buildView(
    HomePageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("五行缺脑"),
      leading: IconButton(
        icon: Icon(Icons.all_inclusive),
        onPressed: () => dispatch(HomePageActionCreator.onShowLibrary()),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.tv),
          onPressed: () => dispatch(HomePageActionCreator.onShowTV()),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => dispatch(HomePageActionCreator.onShowSearchAction()),
        ),
      ],
    ),
    body: ModalProgressHUD(
      dismissible: true,
      color: Colors.transparent,
      opacity: 1,
      child: EasyRefresh(
        refreshHeader: BallPulseHeader(
          color: Theme.of(viewService.context).primaryColorLight,
          key: state.headerKey,
        ),
        key: state.easyRefreshKey,
        child: ListView.builder(
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
        ),
        onRefresh: () => dispatch(HomePageActionCreator.onFetchAction()),
      ),
      inAsyncCall: state.isLoading,
    ),
  );
}
