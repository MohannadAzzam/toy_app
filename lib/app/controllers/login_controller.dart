import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toy_app/app/data/models/login/login_response.dart';

import '../const/constants.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var data;

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
        // print("Login Done \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
        print("Login Done name :  ${jsonData['user']['name']}");
        // User user = jsonData;
        // LoginResponse loginResponse = LoginResponse.fromJson(jsonData);

        data = jsonData;

        // print("Login Done :  ${user.name}");
        // print("Login Done :  ${user['name']}");
        //     Get.defaultDialog(title: "success" , content: Text("${jsonData['user']['name']}"));

        return jsonData;
      }
    } catch (e) {
      // print("Login Failed \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
      print("Login Failed  $e");
      Get.defaultDialog(title: "error", content: Text("$e"));
    }

    // Future<User?> loginWithEmail( ) async {
    //
    // var s = await RemoteLoginService.loginWithEmail(emailController.text, passwordController.text);
    // try{
    //   Get.defaultDialog(title: "Success" , content: Text("${s!.user}"));
    //   return s.user;
    // }
    // finally{
    //   Get.defaultDialog(title: "Error" , content: Text("${s!.user}"));
    //   return null;
    // }
  }

  //  loginWithEmail( ) async {
  //   try {
  //     Map body = {'email': emailController.text.trim() , 'password': emailController.text.trim()};
  //     var response = await http.post(Uri.parse("${baseApiLink}login"),
  //         body: body);
  //     if (response.statusCode == 200) {
  //       var jsonData =  jsonDecode(response.body);
  //       // print("Login Done \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
  //       print("Login Done name :  ${jsonData['user']['name']}");
  //       // User user = jsonData;
  //       // LoginResponse loginResponse = LoginResponse.fromJson(jsonData);
  //       // print("Login Done :  ${user.name}");
  //       // print("Login Done :  ${user['name']}");
  //       Get.defaultDialog(title: "Success" , content: Text("${jsonData['user']}"));
  //
  //       return jsonData;
  //     } else{
  //       Get.defaultDialog(title: "if error" , content: Text("${response.body}"));
  //
  //     }
  //   } catch (e) {
  //     // print("Login Failed \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
  //     print("Login Failed  $e");
  //     Get.defaultDialog(title: "error" , content: Text("$e"));
  //
  //   }
  // }

  bool? isChecked = true;

  isClicked(newVal) {
    isChecked = newVal;
    update();
  }
}

class RemoteLoginService {
  static Future<LoginResponse?> loginWithEmail(var email, var password) async {
    try {
      Map body = {'email': email, 'password': password};
      var response =
          await http.post(Uri.parse("${baseApiLink}login"), body: body);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        // print("Login Done \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
        print("Login Done name :  ${jsonData['user']['name']}");
        // User user = jsonData;
        LoginResponse loginResponse = LoginResponse.fromJson(jsonData);
        // print("Login Done :  ${user.name}");
        // print("Login Done :  ${user['name']}");
        return loginResponse;
      }
    } catch (e) {
      // print("Login Failed \n emailController.text : ${emailController.text} \n passwordController.text : ${passwordController.text}");
      print("Login Failed  $e");
    }
    return null;
  }
}
