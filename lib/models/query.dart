class QueryOptionSet {
  String title;
  List<QueryOption> options;

  QueryOptionSet({this.title, this.options});

  QueryOptionSet.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['options'] != null) {
      options = List<QueryOption>();
      json['options'].forEach((v) {
        options.add(QueryOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QueryOption {
  String key;
  String text;
  bool isSelected = false;

  QueryOption({this.key, this.text, this.isSelected});

  QueryOption.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    text = json['text'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['key'] = this.key;
    data['text'] = this.text;
    return data;
  }
}
