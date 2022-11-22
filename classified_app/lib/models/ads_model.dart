class AdsModel {
  String? id;
  String? title;
  String? description;
  num? price;
  String? mobile;
  List<dynamic>? images;
  String? author;
  String? created;

  AdsModel(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.mobile,
      this.images,
      this.author,
      this.created});

  AdsModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    mobile = json['mobile'];
    images = json['images'] ?? ["assets/noimg.jpg"].cast<String>();
    author = json['authorName'];
    created = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['mobile'] = mobile;
    data['images'] = images;
    data['authorName'] = author;
    data['createdAt'] = created;
    return data;
  }
}
