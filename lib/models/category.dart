import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/models/video.dart';

enum Category {
  film,
  drama,
  variety,
  cartoon,
  documentary,
}

class CategoryVideo {
  List<QueryOptionSet> query = [];
  List<Video> items = [];

  CategoryVideo({this.query, this.items});

  CategoryVideo.fromJson(Map<String, dynamic> json) {
    if (json["query"] != null) {
      query = List<QueryOptionSet>();
      json['query'].forEach((v) {
        query.add(QueryOptionSet.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = List<Video>();
      json['items'].forEach((v) {
        items.add(Video.fromJson(v));
      });
    }
  }
}
