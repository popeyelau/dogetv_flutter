import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/pages/video_page/video_info_component/view.dart';

class VideoHeaderComponent extends Component<Video> {
  VideoHeaderComponent() : super(view: buildView);
}
