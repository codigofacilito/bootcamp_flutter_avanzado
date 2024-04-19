class PostModel {
  int id;
  String title;
  String body;
  int userId;

  PostModel({this.id = 0, this.title = "", this.body = "", this.userId = 0});

  factory PostModel.toObject(Map<String, dynamic> json) {
    return PostModel(
        id: int.parse(json["id"].toString()),
        title: json["title"],
        body: json["body"],
        userId: int.parse(json["userId"].toString()));
  }

  Map<String, dynamic> toMap() => {
        "id": (id > 0) ? id.toString() : "",
        "title": title,
        "body": body,
        "userId": userId.toString()
      };
}
