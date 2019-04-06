import 'package:dogetv_flutter/models/category.dart';
import 'package:dogetv_flutter/models/channel.dart';
import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:dogetv_flutter/models/video_detail.dart';
import 'package:dogetv_flutter/utils/api_client.dart';

class APIs {
  static Future<Home> getMovies() async {
    Future getTopics = APIClient().get("/topics");
    Future getSections = APIClient().get("/videos");

    var responseDatas = await Future.wait([getTopics, getSections]);
    Map topics = responseDatas[0];
    Map sections = responseDatas[1];

    Home home = Home();
    for (var section in sections["data"]) {
      home.sections.add(VideoSection.fromJson(section));
    }
    for (var section in topics["data"]) {
      home.topics.add(Topic.fromJson(section));
    }
    return home;
  }

  static Future<CategoryVideo> getVideos(Category category,
      {String queryString = "-Shot", int pageIndex = 1}) async {
    String key = category.toString().replaceAll("Category.", "");

    Map map =
        await APIClient().get("/videos/$key?p=$pageIndex&query=$queryString");

    if (map["data"] == null) {
      return Future.error(map["msg"]);
    }

    CategoryVideo videos = CategoryVideo.fromJson(map["data"]);
    return videos;
  }

  static Future<List<Topic>> getTopics() async {
    Map map = await APIClient().get("/topics");
    List<Topic> topics = [];
    for (var topic in map["data"]) {
      topics.add(Topic.fromJson(topic));
    }
    return topics;
  }

  static Future<List<Video>> search(String keywords,
      {int pageIndex = 1}) async {
    Map map = await APIClient().get("/search?wd=$keywords&p=$pageIndex");
    List<Video> results = [];
    for (var video in map["data"]) {
      results.add(Video.fromJson(video));
    }
    return results;
  }

  static Future<List<Video>> getTopicDetail(String topicId) async {
    if (topicId == null) {
      return null;
    }
    Map map = await APIClient().get("/topic/$topicId");
    List<Video> topicVideos = [];
    for (var video in map["data"]["items"]) {
      topicVideos.add(Video.fromJson(video));
    }
    return topicVideos;
  }

  static Future<List<Channel>> getTVChannels() async {
    Map map = await APIClient().get("/tv");
    List<Channel> channels = [];
    for (var channel in map["data"]) {
      channels.add(Channel.fromJson(channel));
    }
    channels.sort((r1, r2) => r1.name.compareTo(r2.name));
    return channels;
  }

  static Future<VideoDetail> getVideo(String videoId) async {
    Future getVideo = APIClient().get("/video/$videoId");
    Future getEpisodes = APIClient().get("/video/$videoId/episodes");

    var responseDatas = await Future.wait([getVideo, getEpisodes]);
    Map video = responseDatas[0];
    Map episodesMap = responseDatas[1];

    if (video["code"] != 200 || episodesMap["code"] != 200) {
      return null;
    }

    VideoDetail videoDetail = VideoDetail();

    videoDetail.video = Video.fromJson(video["data"]);
    List<Episode> episodes = [];
    for (var episode in episodesMap["data"]) {
      episodes.add(Episode.fromJson(episode));
    }
    videoDetail.episodes = episodes;
    return videoDetail;
  }

  static Future<String> getStreamURL(String source) async {
    Map params = {"url": source};
    Map stream = await APIClient().post("/video/resolve", data: params);
    return stream["data"];
  }

  static Future<List<Episode>> getEpisodes(
      String videoId, String source) async {
    Map episodesMap =
        await APIClient().get("/video/$videoId/episodes?source=$source");
    List<Episode> episodes = [];
    if (episodesMap["code"] != 200) {
      return episodes;
    }

    for (var episode in episodesMap["data"]) {
      episodes.add(Episode.fromJson(episode));
    }
    return episodes;
  }
}
