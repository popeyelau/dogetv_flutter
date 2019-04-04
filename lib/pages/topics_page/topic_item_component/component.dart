import 'package:dogetv_flutter/models/home.dart';
import 'package:dogetv_flutter/pages/topics_page/topic_item_component/effect.dart';
import 'package:dogetv_flutter/pages/topics_page/topic_item_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicItemComponent extends Component<Topic> {
  TopicItemComponent() : super(view: buildView, effect: buildEffect());
}
