class UserModel {
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? imgURL;

  UserModel({this.name, this.email, this.password, this.mobile, this.imgURL});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    imgURL = json['imgURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['imgURL'] = imgURL;
    return data;
  }
}
