import 'package:dogetv_flutter/models/video.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/category_page/grid_item_component/view.dart';
import 'package:dogetv_flutter/pages/category_page/grid_item_component/effect.dart';

class VideoGridItemComponent extends Component<Video> {
  VideoGridItemComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
        );
}
