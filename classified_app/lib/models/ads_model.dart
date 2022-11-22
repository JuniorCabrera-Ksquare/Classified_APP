class AdsModel {
  String? title;
  String? description;
  num? price;
  String? mobile;
  List<dynamic>? images;

  AdsModel(
      {this.title, this.description, this.price, this.mobile, this.images});

  AdsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    mobile = json['mobile'];
    images = json['images'] ?? ["assets/noimg.jpg"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['mobile'] = mobile;
    data['images'] = images;
    return data;
  }
}
