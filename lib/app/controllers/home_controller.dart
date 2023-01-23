import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:toy_app/app/const/constants.dart';

import '../data/models/home/home_response.dart';

class HomeController extends GetxController {
  // var categoryList = <Categore>[].obs;
  // List<Categore?>? categoryList = [];
  // var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
    fetchSupportTeams();
  }

   Future<List<Categore?>?> fetchCategory() async {
    var category = await RemoteServices.getHomeResponse();
    try {
      return category.items!.categores;
    } finally {
    }
  }
  Future<List<SupportTeam?>?> fetchSupportTeams() async {
    var supportTeams = await RemoteServices.getHomeResponse();
    try {
      return supportTeams.items!.supportTeams;
    } finally {
    }
  }
  Future<List<Blog?>?> fetchBolg() async {
    var blog = await RemoteServices.getHomeResponse();
    try {
      print(blog);
      return blog.items!.blogs;
    } finally {
    }
  }
}

class RemoteServices {
  static Future<HomeResponse> getHomeResponse() async {
    var response = await http.get(
      Uri.parse("${baseApiLink}home"),
    );
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      HomeResponse responseBody = HomeResponse.fromJson(jsonData);
      return responseBody;
    } else {
      return throw Exception(
          "=============Failed to load categories==============");
    }
  }
//
// static var client = http.Client();
//
// static Future<List<Categores>?> fetchCategory() async {
//   var response =
//       await client.get(Uri.parse('https://etr.hexacit.com/api/home'));
//
//   if (response.statusCode == 200) {
//     var jsonString = response.body;
//     return categoresFromJson(jsonString);
//   } else {
//     return null;
//   }
// }
}
