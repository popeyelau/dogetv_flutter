import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/home_page/main.dart';
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
          dependencies: Dependencies<HomePageState>(
              adapter: MovieGroupAdapter(),
              slots: <String, Dependent<HomePageState>>{}),
        );
}

Widget buildView(
    HomePageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("五行缺脑"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.tv),
          onPressed: () => dispatch(HomePageActionCreator.onShowTV()),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    ),
    body: ModalProgressHUD(
      dismissible: true,
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
