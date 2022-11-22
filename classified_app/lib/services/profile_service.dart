import 'dart:convert';
import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProfileService {
  Future readProfile(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic token = await storage.read(key: 'token');
    Uri url = Uri.parse(Constants().serverUrl + Constants().userReadEP);
    Map<String, dynamic> modelObj = {};
    try {
      Response response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      modelObj = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(modelObj["data"]);
      return user;
    } catch (e) {
      StatusManager().manageStatus(context, null, null);
    }
  }

  Future updateProfile(context, UserModel userModel) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic token = await storage.read(key: 'token');
    Uri url = Uri.parse(Constants().serverUrl + Constants().userUpdateEP);
    Map<String, dynamic> modelObj = userModel.toJson();
    try {
      Response response = await http.patch(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(modelObj));
      modelObj = jsonDecode(response.body);
      StatusManager()
          .manageStatus(context, modelObj["status"], modelObj["message"]);
      return modelObj["status"];
    } catch (e) {
      StatusManager().manageStatus(context, null, null);
      return false;
    }
  }
}
