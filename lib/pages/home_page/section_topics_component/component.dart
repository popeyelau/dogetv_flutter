import 'package:dogetv_flutter/models/home.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/home_page/section_topics_component/view.dart';
import 'package:dogetv_flutter/pages/home_page/section_topics_component/effect.dart';

class TopicHorizontalComponent extends Component<List<Topic>> {
  TopicHorizontalComponent() : super(view: buildView, effect: buildEffect());
}
