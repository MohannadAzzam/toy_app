import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:toy_app/app/const/constants.dart';

import '../data/models/travels/travel_response.dart';
import 'locale/local_controller.dart';

class TravelsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchTravels();
  }

  Future<List<Travel>> fetchTravels() async {
    var travels = await TravelRemoteService.getTravelResponse();
    print(travels);
    try {
      print("====================${travels.items.travels}===================");
      return travels.items.travels;
    } finally {
      print("fetchTravels method error");
    }
  }
}

class TravelRemoteService {
  static Future<TravelResponse> getTravelResponse() async {
    Map<String, String> headers = {
      "Accept-Language": "${MyLocalController.locale}",
      "Accept": "application/json"
    };

    var response =
        await http.get(Uri.parse("${baseApiLink}travels"), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await json.decode(response.body);
      TravelResponse travelResponse = TravelResponse.fromJson(jsonData);
      return travelResponse;
    } else {
      return throw Exception(
          "=============Failed to load Home response ==============");
    }
  }
}
