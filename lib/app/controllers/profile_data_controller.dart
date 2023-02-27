import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../const/constants.dart';
import '../data/models/profile_user_data_response.dart';

class ProfileDataController extends GetxController {

  Future<User?> getUserData() async {
    try{
      var userData = await RemoteDataResponse.getHomeResponse();
      return userData.user;
    }catch (e){
      print(e);
      return null;
    }
  }

  @override
  void onInit() {
      super.onInit();
      getUserData();
  }

}

class RemoteDataResponse {
  static Future<ProfileResponse> getHomeResponse() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${sharedPreferences!.getString('token')}"
    };

    var response =
        await http.get(Uri.parse('${baseApiLink}MyProfile'), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      ProfileResponse profileResponse = ProfileResponse.fromJson(jsonData);
      // print("jsonData $jsonData");
      return profileResponse;
    } else {
      return throw Exception(
          "=============Failed to load Home response ==============");
    }
  }
}
