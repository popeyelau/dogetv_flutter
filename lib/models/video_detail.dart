import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/models/video.dart';

class VideoDetail {
  Video video;
  List<Episode> episodes = [];

  VideoDetail({this.video, this.episodes});
}
