import 'dart:convert';
import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthService {
  Future userRegister(context, UserModel userModel) async {
    Uri url = Uri.parse(Constants().serverUrl + Constants().registerEP);
    Map<String, dynamic> modelObj = userModel.toJson();
    try {
      Response response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
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

  Future userLogin(context, UserModel userModel) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url = Uri.parse(Constants().serverUrl + Constants().loginEP);
    Map<String, dynamic> modelObj = userModel.toJson();
    try {
      Response response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(modelObj));
      modelObj = jsonDecode(response.body);
      if (modelObj["status"]) {
        storage.write(key: "userID", value: modelObj["data"]["user"]["_id"]);
        storage.write(key: "token", value: modelObj["data"]["token"]);
      } else {
        StatusManager()
            .manageStatus(context, modelObj["status"], modelObj["message"]);
      }
      return modelObj["status"];
    } catch (e) {
      StatusManager().manageStatus(context, null, null);
      return false;
    }
  }
}
