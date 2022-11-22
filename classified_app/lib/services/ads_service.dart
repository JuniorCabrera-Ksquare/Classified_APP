import 'dart:convert';
import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
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
}
