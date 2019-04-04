class Video {
  String id;
  String name;
  String actor;
  String director;
  String cover;
  String desc;
  String area;
  String year;
  String tag;
  String score;
  String state;
  int source;

  Video(
      {this.id,
      this.name,
      this.actor,
      this.director,
      this.cover,
      this.desc,
      this.area,
      this.year,
      this.tag,
      this.score,
      this.state,
      this.source});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actor = json['actor'];
    director = json['director'];
    cover = json['cover'];
    desc = json['desc'];
    area = json['area'];
    year = json['year'];
    tag = json['tag'];
    score = json['score'];
    state = json['state'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['actor'] = this.actor;
    data['director'] = this.director;
    data['cover'] = this.cover;
    data['desc'] = this.desc;
    data['area'] = this.area;
    data['year'] = this.year;
    data['tag'] = this.tag;
    data['score'] = this.score;
    data['state'] = this.state;
    data['source'] = this.source;
    return data;
  }
}
