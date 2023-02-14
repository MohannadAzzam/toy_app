import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/main.dart';

class MyLocalController extends GetxController {
  Locale initLang = sharedPreferences!.getString("lang") == "ar"
      ? Locale("ar")
      : Locale("en");
  static var locale ;

  @override
  void onInit(){
    super.onInit();
  }

  changeLang(String codeLang) {
    locale = Locale(codeLang);
    print("localeeeee ${Get.deviceLocale.toString().substring(0,2)} ");
    sharedPreferences!.setString("lang", codeLang);
    Get.updateLocale(locale);
    update();
  }
}

// class LanguageRemoteService {
//   static Future<LanguageResponse> getLanguageResponse(String lang) async {
//     Map<String, String> headers = {"Accept-Language": lang, "Accept": "application/json"};
//
//     var response =
//     await http.post(Uri.parse("${baseApiLink}changeLanguge"), headers: headers);
//
//     if (response.statusCode == 200) {
//       var jsonData = await jsonDecode(response.body);
//
//       LanguageResponse LangualgeResponse = LanguageResponse.fromJson(jsonData);
//       return LangualgeResponse;
//     } else {
//       return throw Exception(
//           "=============Failed to load Blog response ==============");
//     }
//   }
// }
