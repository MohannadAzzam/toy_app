import 'dart:convert';

import 'package:get/get.dart';
import 'package:toy_app/app/const/constants.dart';

import '../data/models/blog/blog_response.dart';
import 'package:http/http.dart' as http;

class BlogController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchBlog();
  }


  Future<List<Item>> fetchBlog() async {
    var blog = await BlogRemoteService.getBlogResponse();
    try {
      return blog.items;
    } finally {
      print("fetchBlog method error");
    }
  }
}

class BlogRemoteService {
  static Future<BlogResponse> getBlogResponse() async {
    Map<String, String> headers = {
      "Accept-Language": "ar",
      "Accept": "application/json"
    };
    var response =
        await http.get(Uri.parse("${baseApiLink}blogs"), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);

      BlogResponse blogResponse = BlogResponse.fromJson(jsonData);
      return blogResponse;
    } else {
      return throw Exception(
          "=============Failed to load Blog response ==============");
    }
  }
}
