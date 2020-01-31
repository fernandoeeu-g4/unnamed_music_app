class TagModel {
  String name;
  String url;
  int id;

  TagModel({this.name, this.url, this.id});

  TagModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}