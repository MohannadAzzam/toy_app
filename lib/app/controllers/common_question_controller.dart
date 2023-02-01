import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';
import 'package:toy_app/app/controllers/locale/local_controller.dart';

import '../data/models/commonQuestion/common_question_response.dart';

class CommonQuestionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCommonQuestion();
  }

  Future<List<Item>> fetchCommonQuestion() async {
    var commonQuestions =
        await CommonQuestionRemoteService.getCommonQuestionResponse();
    try {
      return commonQuestions.items;
    } finally {
      print("fetchCommonQuestion method error");
    }
  }
}

class CommonQuestionRemoteService {
  static Future<CommonQuestionResponse> getCommonQuestionResponse() async {
    MyLocalController mylocalController = Get.put(MyLocalController());
    Map<String, String> headers = {
      "Accept-Language": "${mylocalController.initLang}",
      "Accept": "application/json"
    };


    var response =
        await http.get(Uri.parse("${baseApiLink}getFaq"), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);

      CommonQuestionResponse commonQuestionResponse =
          CommonQuestionResponse.fromJson(jsonData);

      return commonQuestionResponse;
    } else {
      return throw Exception(
          "=============Failed to load CommonQuestion response ==============");
    }
  }
}
