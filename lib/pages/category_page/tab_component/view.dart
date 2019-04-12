import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

//dispatch(CategoryTabPageActionCreator.onLoadMoreAction()
Widget buildView(
    CategoryTabPageState state, dispatch, ViewService viewService) {
  return CustomScrollView(controller: state.controller, slivers: [
    KeepAliveWidget(child: viewService.buildComponent("query-panel")),
    KeepAliveWidget(child: viewService.buildComponent("video-grid")),
  ]);
}

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  KeepAliveWidget({@required this.child});

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
