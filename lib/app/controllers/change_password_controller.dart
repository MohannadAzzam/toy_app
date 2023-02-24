import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';

import '../../main.dart';

class ChangePasswordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // changePassword();
  }

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  var isLoading = false;

  changePassword() async {
    isLoading   = true;
    try {
      Map body = {
        'old_password': oldPasswordController.text,
        'password': newPasswordController.text,
        'confirm_password': confirmNewPasswordController.text,
      };
      Map<String, String> headers = {
        "Authorization": "Bearer ${sharedPreferences!.getString('token')}"
      };
      var response = await http.post(
          Uri.parse("${baseApiLink}changePassword"), body: body, headers:headers);

      if(response.statusCode == 200){
        var jsonData = await jsonDecode(response.body);

        if (jsonData['status'] == false){
          Get.defaultDialog(
              title: "Error",
              content: Text("${jsonData['message']}")
          );
        } else{
          // Get.defaultDialog(
          //     title: "",
          //     content: Center(child: const CircularProgressIndicator(),)
          // );
          // token = sharedPreferences?.setString("token", "$token") as String?;
          isLoading = false;
          Get.snackbar("${jsonData['status']}", "${jsonData['message']}");
          oldPasswordController.clear();
          newPasswordController.clear();
          confirmNewPasswordController.clear();
          // Get.back();

        }
      }
    } catch (e) {
      print(e);
    }
  }

}