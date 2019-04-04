class Channel {
  String name;
  String icon;
  String url;

  Channel({this.name, this.icon, this.url});

  Channel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}
