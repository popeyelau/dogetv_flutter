import 'package:fish_redux/fish_redux.dart';

class CategoryPageState implements Cloneable<CategoryPageState> {
  final List<String> categories = ["电影", "电视剧", "综艺", "动漫", "记录片"];
  int initialIndex = 0;

  @override
  CategoryPageState clone() {
    return CategoryPageState()..initialIndex;
  }
}

CategoryPageState initState(Map<String, dynamic> map) {
  return CategoryPageState()..initialIndex = map["index"];
}
