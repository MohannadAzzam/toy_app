import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';
import 'package:toy_app/app/data/models/sponsors/sponsors_response.dart';

class SponsorsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchSponsors();
  }

  Future<List<dynamic>> fetchSponsors() async {
    var sponsors = await SponsorsRemoteService.getSponsorResponse();

    try {
      return sponsors.items.sponsors;
    } finally {
      print("fetchSponsors method error");
    }
  }
}

class SponsorsRemoteService {
  static Future<SponsorsResponse> getSponsorResponse() async {

    // Map<String, String> headers = {"Accept-Language": "ar", "Accept": "application/json"};

    Map<String, String> headers = {
      "Accept-Language": "ar",
      "Accept": "application/json"
    };

    var response =
        await http.get(Uri.parse("${baseApiLink}sponsors"), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);

      SponsorsResponse sponsorsResponse = SponsorsResponse.fromJson(jsonData);

      return sponsorsResponse;
    } else {
      return throw Exception(
          "=============Failed to load Home response ==============");
    }
  }
}
