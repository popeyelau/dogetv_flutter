import 'package:dogetv_flutter/pages/tv_page/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/tv_page/adapter.dart';
import 'package:dogetv_flutter/pages/tv_page/effect.dart';
import 'package:dogetv_flutter/pages/tv_page/reducer.dart';
import 'package:dogetv_flutter/pages/tv_page/state.dart';

class TVPage extends Page<TVPageState, Map<String, dynamic>> {
  TVPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<TVPageState>(
              adapter: TVListAdapter(),
              slots: <String, Dependent<TVPageState>>{}),
        );
}

Widget buildView(TVPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(state.title),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.extension),
            onPressed: () =>
                dispatch(TVPageActionCreator.onUpdateSourceAction())),
      ],
    ),
    body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0),
        )),
  );
}
