import 'package:dogetv_flutter/pages/category_page/grid_component/adapter.dart';
import 'package:dogetv_flutter/pages/category_page/grid_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/grid_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class VideoGridComponent extends Component<VideoGridState> {
  VideoGridComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<VideoGridState>(
              adapter: VideoGridListAdapter(),
            ));
}
