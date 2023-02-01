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
    fetchBolg();
  }

   Future<List<Categore?>?> fetchCategory() async {
    var category = await HomeRemoteService.getHomeResponse();
    try {
      return category.items!.categores;
    } finally {
      print("fetchCategory method error");

    }
  }
  Future<List<SupportTeam?>?> fetchSupportTeams() async {
    var supportTeams = await HomeRemoteService.getHomeResponse();
    try {
      return supportTeams.items!.supportTeams;
    } finally {
      print("fetchSupportTeams method error");

    }
  }
  Future<List<Blog?>?> fetchBolg() async {
    var blog = await HomeRemoteService.getHomeResponse();
    try {
      print(blog);
      return blog.items!.blogs;
    } finally {
      print("fetchBolg method error");

    }
  }
}

class HomeRemoteService {
  static Future<HomeResponse> getHomeResponse() async {

    Map<String, String> headers = {"Accept-Language": "ar", "Accept": "application/json"};

    var response = await http.get(
      Uri.parse("${baseApiLink}home"),headers: headers
    );
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      HomeResponse responseBody = HomeResponse.fromJson(jsonData);
      return responseBody;
    } else {
        return throw Exception(
            "=============Failed to load Home response ==============");
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
