import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';
import 'package:toy_app/main.dart';

class LogOutController extends GetxController {
  // sharedPreferences!.setString("token", "${jsonData['user']['access_token']}");
  // sharedPreferences!.setString("username", "${jsonData['user']['name']}");
  //  sharedPreferences!.setString("mobile", "${jsonData['user']['mobile']}");
  // sharedPreferences!.setString("country_id", "${jsonData['user']['country_id']}");
  // sharedPreferences!.setString("image", "${jsonData['user']['image']}");

  logOut() async {
    try {
      String? token = sharedPreferences!.getString('token');
      // String? username = sharedPreferences!.getString('username');
      // String? mobile = sharedPreferences!.getString('mobile');
      // String? countryId = sharedPreferences!.getString('country_id');

      // Map<String, dynamic> body = {
      //   'name': username,
      //   'mobile': mobile,
      //   'country_id' : countryId,
      // };

      Map<String, String> headers = {"Authorization": "Bearer $token"};

      var response = await http.get(Uri.parse("${baseApiLink}logout"),
          /*body: body,*/
          headers: headers);

      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        // print(jsonData);
        if (jsonData['status'] == false) {
          Get.defaultDialog(
              title: "Error", content: Text("${jsonData['message']}"));
        } else {
          Get.snackbar("${jsonData['status']}", "${jsonData['message']}");
          Get.back();
        }
      }
    } catch (e) {
      print('catch error $e');
    }
  }
}
