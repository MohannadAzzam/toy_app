import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/constants.dart';
import '../screens/home/home_page.dart';
import 'locale/local_controller.dart';

class ContactUsController extends GetxController {



  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  // TextEditingController countryController       = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController messageTitleController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  String? countryController;

  contactUs() async {
    try {
      Map body = {
        'email': emailController.text,
        'name': nameController.text,
        'mobile': mobileController.text,
        'country': countryController,
        'titel': messageTitleController.text,
        'message': messageTextController.text,
      };

      Map<String, String> headers = {"Accept-Language": "${MyLocalController.locale}", "Accept": "application/json"};

      var response =
          await http.post(Uri.parse("${baseApiLink}contactUs"), body: body,headers:  headers);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        // print("Login Done name :  ${jsonData['user']}");

        if (jsonData['status'] == false) {
          Get.defaultDialog(
              title: "Error", content: Text("$jsonData"));
        } else {
          Get.snackbar("Message sent", "");
          nameController.clear();
          mobileController.clear();
          emailController.clear();
          messageTitleController.clear();
          messageTextController.clear();
          Get.to(() => HomePage());
          // print("token $token");
        }
      }
    } catch (e) {
      // print("Login Failed  $e");
      Get.defaultDialog(title: "error", content: Text("$e"));
    }
  }
}
