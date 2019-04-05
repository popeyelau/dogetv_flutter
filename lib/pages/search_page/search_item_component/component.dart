import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/search_page/search_item_component/effect.dart';
import 'package:dogetv_flutter/pages/search_page/search_item_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class SearchItemComponent extends Component<Video> {
  SearchItemComponent() : super(view: buildView, effect: buildEffect());
}
