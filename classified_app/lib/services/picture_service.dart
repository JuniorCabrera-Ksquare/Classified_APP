import 'dart:convert';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PictureService {
  Future uploadPicture(String imgPath) async {
    Uri url = Uri.parse(Constants().serverUrl + Constants().profilePicture);
    try {
      MultipartRequest request = http.MultipartRequest("POST", url);
      MultipartFile img = await http.MultipartFile.fromPath("avatar", imgPath);
      request.files.add(img);
      StreamedResponse response = await request.send();
      dynamic responseStream = await response.stream.bytesToString();
      dynamic responseJson = jsonDecode(responseStream);
      String imgURL = responseJson["data"]["path"];
      return imgURL;
    } catch (e) {
      StatusManager().manageStatus("context", null, null);
    }
  }
}
