import 'package:dogetv_flutter/models/channel.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/effect.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/view.dart';

class TVItemComponent extends Component<Channel> {
  TVItemComponent() : super(view: buildView, effect: buildEffect());
}
