import 'package:dogetv_flutter/pages/category_page/tab_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

Widget buildView(
    CategoryTabPageState state, dispatch, ViewService viewService) {
  return state.isLoading
      ? Center(child: CircularProgressIndicator())
      : EasyRefresh(
          refreshFooter: BallPulseFooter(
            color: Theme.of(viewService.context).primaryColorLight,
            key: state.headerKey,
          ),
          key: state.easyRefreshKey,
          child: CustomScrollView(slivers: [
            KeepAliveWidget(child: viewService.buildComponent("query-panel")),
            KeepAliveWidget(child: viewService.buildComponent("video-grid")),
          ]),
          loadMore: () =>
              dispatch(CategoryTabPageActionCreator.onLoadMoreAction()),
        );
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
