import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/controllers/locale/local_controller.dart';

import '../const/constants.dart';
import '../data/models/aboutUs/abouUs_response.dart';

class AboutUsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPage();
  }

  Future<AboutUsResponse> fetchPage() async {
    final MyLocalController m = Get.put(MyLocalController());
    try {
      Map<String, String> headers = {
        "Accept-Language": "${MyLocalController.locale}",
        "Accept": "application/json"
      };

      var response =
      await http.get(Uri.parse("${baseApiLink}pages/1"), headers: headers);

      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);

        AboutUsResponse aboutUsResponse = AboutUsResponse.fromJson(jsonData);
        return aboutUsResponse;
      } else {
        return throw Exception(
            "=============Failed to load AboutUs response ==============");

    }    } finally {
      print("fetchPage method error");
    }
  }
}

class AboutUsRemoteService {
  static Future<AboutUsResponse> getAboutUsResponse() async {
    Map<String, String> headers = {
      "Accept-Language": "${MyLocalController.locale}",
      "Accept": "application/json"
    };

    var response =
        await http.get(Uri.parse("${baseApiLink}pages/2"), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);

      AboutUsResponse aboutUsResponse = AboutUsResponse.fromJson(jsonData);
      return aboutUsResponse;
    } else {
      return throw Exception(
          "=============Failed to load AboutUs response ==============");
    }
  }
}
