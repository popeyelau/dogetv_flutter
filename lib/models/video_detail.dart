import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/models/video.dart';

class VideoDetail {
  VideoInfo video;
  List<Episode> episodes = [];

  VideoDetail({this.video, this.episodes});
}

class VideoInfo {
  Video info;
  List<Video> recommends;

  VideoInfo({this.info, this.recommends});

  VideoInfo.fromJson(Map<String, dynamic> json) {
    if (json["info"] != null) {
      info = Video.fromJson(json["info"]);
    }
    if (json['recommends'] != null) {
      recommends = List<Video>();
      json['recommends'].forEach((v) {
        recommends.add(Video.fromJson(v));
      });
    }
  }
}
