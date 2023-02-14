import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';
import '../data/models/tickets/ticket_response.dart';
import 'locale/local_controller.dart';

class TicketController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchItemEvent();
    // fetchItemEvents();
  }

  Future<List<ItemsEvent>> fetchItemEvent() async {
    var itemEvent = await TicketRemoteService.getTicketResponse();
    try {
      return itemEvent.items.events;
    } finally {
      print("fetchItemEvent method error");
    }
  }
}

class TicketRemoteService {
  static Future<TicketResponse> getTicketResponse() async {

    Map<String, String> headers = {"Accept-Language": "${MyLocalController.locale}", "Accept": "application/json"};

    var response = await http.get(Uri.parse("${baseApiLink}tickets"),headers: headers);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      TicketResponse ticketResponse = TicketResponse.fromJson(jsonData);
      return ticketResponse;
    } else {
      return throw Exception(
          "=============Failed to load Ticket response ==============");
    }
  }
}
