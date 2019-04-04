import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/home_page/section_grid_component/effect.dart';
import 'package:dogetv_flutter/pages/home_page/section_grid_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class SectionGridComponent extends Component<List<Video>> {
  SectionGridComponent() : super(view: buildView, effect: buildEffect());
}
