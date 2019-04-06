import 'package:dogetv_flutter/pages/topics_page/effect.dart';
import 'package:dogetv_flutter/pages/topics_page/state.dart';
import 'package:dogetv_flutter/pages/topics_page/reducer.dart';
import 'package:dogetv_flutter/pages/topics_page/adapter.dart';
import 'package:dogetv_flutter/pages/topics_page/view.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicsPage extends Page<TopicsPageState, Map<String, dynamic>> {
  TopicsPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<TopicsPageState>(
              adapter: TopicListAdapter(),
              slots: <String, Dependent<TopicsPageState>>{}),
        );
}
