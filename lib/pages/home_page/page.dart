import 'package:dogetv_flutter/pages/home_page/view.dart';
import 'package:dogetv_flutter/pages/home_page/adapter.dart';
import 'package:dogetv_flutter/pages/home_page/state.dart';
import 'package:dogetv_flutter/pages/home_page/effect.dart';
import 'package:dogetv_flutter/pages/home_page/reducer.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
  ctx.state.scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text("hello world"),
  ));
  return false;
}
