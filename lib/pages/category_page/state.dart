import 'package:fish_redux/fish_redux.dart';

class CategoryPageState implements Cloneable<CategoryPageState> {
  final List<String> categories = ["电影", "电视剧", "综艺", "动漫", "记录片"];

  @override
  CategoryPageState clone() {
    return CategoryPageState();
  }
}

CategoryPageState initState(Map<String, dynamic> map) {
  return CategoryPageState();
}
