import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';
import 'package:toy_app/app/controllers/locale/local_controller.dart';
import 'package:toy_app/app/data/models/organizers/organizer_response.dart';

class OrganizerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchOrganizer();
  }

  Future<List<dynamic>> fetchOrganizer() async {
    var organizer = await OrganizerRemoteService.getOrganizerResponse();

    try{
       return organizer.items.organizers ;
    }finally{
      print("fetchOrganizer method error");
    }
  }
}

class OrganizerRemoteService {
  static Future<OrganizerResponse> getOrganizerResponse() async {
    Map<String, String> headers = {"Accept-Language": "${MyLocalController.locale}", "Accept": "application/json"};


    var response =
        await http.get(Uri.parse("${baseApiLink}organizers"), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);

      OrganizerResponse organizerResponse =
          OrganizerResponse.fromJson(jsonData);
      return organizerResponse;
    } else {
      return throw Exception(
          "=============Failed to load Organizer response ==============");
    }
  }
}
