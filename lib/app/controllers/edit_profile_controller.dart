import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';

import '../../main.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String? country;
  var isLoading = false;

  editProfile() async {
    isLoading = true;
    try {
      Map body = {
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'country': country,
      };
      Map<String, String> headers = {
        "Authorization": "Bearer ${sharedPreferences!.getString('token')}"
      };
      var response = await http.post(Uri.parse("${baseApiLink}editProfile"),
          body: body, headers: headers);

      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);

        if (jsonData['status'] == false) {
          Get.defaultDialog(
              title: "Error", content: Text("${jsonData['message']}"));
        } else {
          // Get.defaultDialog(
          //     title: "",
          //     content: Center(child: const CircularProgressIndicator(),)
          // );
          // token = sharedPreferences?.setString("token", "$token") as String?;
          isLoading = false;
          Get.snackbar(
              "${jsonData['status']}", "سيتم تغير البيانات خلال لحظات");
          nameController.clear();
          emailController.clear();
          mobileController.clear();
          // oldPasswordController.clear();
          // newPasswordController.clear();
          // confirmNewPasswordController.clear();
          // Get.back();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
