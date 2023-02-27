import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/screens/home/home_page.dart';

import '../../main.dart';
import '../const/constants.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var data;
  var token;
  var isLogedIn ;
  var username;
  var mobile;
  var countryId;
  var image;


  loginWithEmail() async {
    try {
      Map body = {
        'email': emailController.text,
        'password': passwordController.text
      };
      var response =
          await http.post(Uri.parse("${baseApiLink}login"), body: body);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        print("Login Done name :  ${jsonData['user']}");
        data = jsonData;

        if (jsonData['status'] == false){
          Get.defaultDialog(
              title: "Error",
              content: Text("${jsonData['message']}")
          );
          // Get.snackbar("${jsonData['status']}", "${jsonData['message']}");
        } else{
          token = sharedPreferences!.setString("token", "${jsonData['user']['access_token']}");
          username = sharedPreferences!.setString("username", "${jsonData['user']['name']}");
          mobile = sharedPreferences!.setString("mobile", "${jsonData['user']['mobile']}");
          countryId = sharedPreferences!.setString("country_id", "${jsonData['user']['country_id']}");
          image = sharedPreferences!.setString("image", "${jsonData['user']['image']}");

          emailController.clear();
          passwordController.clear();
          Get.snackbar("Login Successfully","Enjoy");
          Get.to(() => HomePage());

          // print("token $token");


        }
      }
    } catch (e) {
      // print("Login Failed \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
      print("Login Failed  $e");
      Get.defaultDialog(title: "error", content: Text("$e"));
    }

  }
  bool? isChecked = true;
  isClicked(newVal) {
    isChecked = newVal;
    update();
  }
}

// class RemoteLoginService {
//   static Future<LoginResponse?> loginWithEmail(var email, var password) async {
//     try {
//       Map body = {'email': email, 'password': password};
//       var response =
//           await http.post(Uri.parse("${baseApiLink}login"), body: body);
//       if (response.statusCode == 200) {
//         var jsonData = await jsonDecode(response.body);
//         // print("Login Done \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
//         print("Login Done name :  ${jsonData['user']['name']}");
//         // User user = jsonData;
//         LoginResponse loginResponse = LoginResponse.fromJson(jsonData);
//         // print("Login Done :  ${user.name}");
//         // print("Login Done :  ${user['name']}");
//         return loginResponse;
//       }
//     } catch (e) {
//       // print("Login Failed \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
//       print("Login Failed  $e");
//     }
//     return null;
//   }
// }
