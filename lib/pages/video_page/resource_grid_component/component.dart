import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/video_page/resource_grid_component/view.dart';

class Resource {
  final List<int> items;
  final int selectedItem;

  Resource({this.items, this.selectedItem = 0});
}

class VideoServerGridComponent extends Component<Resource> {
  VideoServerGridComponent() : super(view: buildView);
}
