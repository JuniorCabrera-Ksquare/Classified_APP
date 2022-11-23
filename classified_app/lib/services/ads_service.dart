import 'dart:convert';
import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AdsService {
  Future fetchAllAds(context) async {
    Uri url = Uri.parse(Constants().serverUrl + Constants().adsEP);
    Map<String, dynamic> modelObj = {};
    List<AdsModel> ads = [];
    try {
      Response response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      modelObj = jsonDecode(response.body);
      var adsData = modelObj["data"];
      ads = adsData.map<AdsModel>((ad) => AdsModel.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      StatusManager().manageStatus(context, null, null);
    }
  }

  Future fetcMyAds(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic token = await storage.read(key: 'token');
    Uri url = Uri.parse(Constants().serverUrl + Constants().adsUserEP);
    Map<String, dynamic> modelObj = {};
    List<AdsModel> ads = [];
    try {
      Response response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      modelObj = jsonDecode(response.body);
      var adsData = modelObj["data"];
      ads = adsData.map<AdsModel>((ad) => AdsModel.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      StatusManager().manageStatus(context, null, null);
    }
  }

  Future updateMyAd(context, AdsModel adsModel) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic token = await storage.read(key: 'token');
    Uri url = Uri.parse(Constants().serverUrl +
        Constants().adsUserUpdateDeleteEP +
        adsModel.id!);
    Map<String, dynamic> modelObj = adsModel.toJson();
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

  Future createMyAd(context, AdsModel adsModel) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    dynamic token = await storage.read(key: 'token');
    Uri url = Uri.parse(Constants().serverUrl + Constants().adsEP);
    Map<String, dynamic> modelObj = adsModel.toJson();
    try {
      Response response = await http.post(url,
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
