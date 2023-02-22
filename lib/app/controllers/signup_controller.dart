import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/const/constants.dart';

import '../screens/auth/login/login_page.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // TextEditingController typeMobileController = TextEditingController();
  String? countryIdController;
  String? userTypeController;
  // String? token;

  // TextEditingController Controller = TextEditingController();

  signUp() async {
    try {
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
        'confirm_password': confirmPasswordController.text,
        'name': nameController.text,
        'mobile': mobileController.text,
        'country': countryIdController,
        'type_mobile': "android",
        'type': userTypeController,
      };

      var response =
          await http.post(Uri.parse("${baseApiLink}signUp"),body: body );

      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        // print("Login Done email :  ${jsonData['user']['email']} \n");
        // print("Login Done type :  ${jsonData['user']['type']} \n");
        // print("Login Done mobile :  ${jsonData['user']['mobile']} \n");
        // print("Login Done country_id :  ${jsonData['user']['country_id']} \n");
        // print("Login Done id :  ${jsonData['user']['id']} \n");
        // print(
        //     "Login Done country_name :  ${jsonData['user']['country_name']} \n");
        // print("SingUp Done name :  ${jsonData['user']['name']}");
        // print("Login Done name :  ${jsonData['message']}");

        if (jsonData['status'] == false){
          Get.defaultDialog(
            title: "Error",
            content: Text("${jsonData['message']}")
          );
          // Get.snackbar("${jsonData['status']}", "${jsonData['message']}");
        } else{
          // token = sharedPreferences?.setString("token", "$token") as String?;
          Get.snackbar("${jsonData['status']}", "${jsonData['message']}");
          Get.to(() => LoginPage());

        }
      }
    } catch (e) {
      print("Login Failed  $e");
      Get.defaultDialog(title: "error", content: Text("$e"));
    }
  }
}
