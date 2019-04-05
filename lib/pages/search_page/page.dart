import 'package:dogetv_flutter/pages/search_page/action.dart';
import 'package:dogetv_flutter/pages/search_page/effect.dart';
import 'package:dogetv_flutter/pages/search_page/state.dart';
import 'package:dogetv_flutter/pages/search_page/reducer.dart';
import 'package:dogetv_flutter/pages/search_page/adapter.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SearchPage extends Page<SearchPageState, Map<String, dynamic>> {
  SearchPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          onError: (ex, ctx) {
            print(ex.toString());
          },
          dependencies: Dependencies<SearchPageState>(
              adapter: SearchResultListAdapter(),
              slots: <String, Dependent<SearchPageState>>{}),
        );
}

Widget buildView(
    SearchPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
            autofocus: true,
            controller: state.controller,
            decoration: InputDecoration(hintText: "Search...")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => dispatch(SearchPageActionCreator.onFetchAction()),
          ),
        ],
      ),
      body: ModalProgressHUD(
        dismissible: true,
        color: Colors.transparent,
        opacity: 1,
        child: EasyRefresh(
          refreshFooter: BallPulseFooter(
            color: Theme.of(viewService.context).primaryColorLight,
            key: state.headerKey,
          ),
          key: state.easyRefreshKey,
          loadMore: () => dispatch(SearchPageActionCreator.onLoadMoreAction()),
          child: ListView.builder(
            itemBuilder: listAdapter.itemBuilder,
            itemCount: listAdapter.itemCount,
            itemExtent: 160,
          ),
        ),
        inAsyncCall: state.isLoading,
      ));
}
