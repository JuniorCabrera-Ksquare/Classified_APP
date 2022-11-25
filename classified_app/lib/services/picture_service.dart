import 'dart:convert';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/status_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class PictureService {
  Future uploadPicture(String imgPathList) async {
    Uri url = Uri.parse(Constants().serverUrl + Constants().profilePictureEP);
    try {
      MultipartRequest request = http.MultipartRequest("POST", url);
      MultipartFile img =
          await http.MultipartFile.fromPath("avatar", imgPathList);
      request.files.add(img);
      StreamedResponse response = await request.send();
      dynamic responseStream = await response.stream.bytesToString();
      dynamic responseJson = jsonDecode(responseStream);
      String imgURL = responseJson["data"]["path"];
      return imgURL;
    } catch (e) {
      print(e);
    }
  }

  Future uploadPhotos(List<XFile> imgPathList) async {
    Uri url = Uri.parse(Constants().serverUrl + Constants().photosEP);
    try {
      MultipartRequest request = http.MultipartRequest("POST", url);
      for (XFile file in imgPathList) {
        MultipartFile img =
            await http.MultipartFile.fromPath("photos", file.path);
        request.files.add(img);
      }
      StreamedResponse response = await request.send();
      dynamic responseStream = await response.stream.bytesToString();
      dynamic responseJson = jsonDecode(responseStream);
      List<dynamic> imagesURL = responseJson["data"]["path"];
      return imagesURL;
    } catch (e) {
      print(e);
    }
  }
}
