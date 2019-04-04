import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/topic_page/topic_video_component/effect.dart';
import 'package:dogetv_flutter/pages/topic_page/topic_video_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicVideoItemComponent extends Component<Video> {
  TopicVideoItemComponent() : super(view: buildView, effect: buildEffect());
}
