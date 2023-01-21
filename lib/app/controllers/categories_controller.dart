import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:toy_app/app/const/constants.dart';

import '../data/models/home_response.dart';

class CategoryController extends GetxController {
  // var categoryList = <Categore>[].obs;
  List<Categore?>? categoryList = [];

  // var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

   Future<List<Categore?>?> fetchCategory() async {
    var category = await RemoteServices.getHomeResponse();
    // var a = category['items']
    // print("===THIS IS THE CATEGORY==== ${category.items!.categores}");
    try {
      // isLoading(true);
      // if (category.items!.categores!.isNotEmpty) {
      //   categoryList!.addAll(cate.items!.categores);
        // print("---------myLog------------${categoryList}");
      // }
      return category.items!.categores;
    } finally {
      // isLoading(false);
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
      // print("==========s=s=s=s=s=======${jsonData['items']}");
      HomeResponse responseBody = HomeResponse.fromJson(jsonData);
      // m.forEach((key, value) {
      //   print("$key : $value");
      // });
      // var i = m.entries.forEach((element) {
      //   print("=============${m}");
      // });
      // print(i);

      // var items = m.keys.toList().indexOf('items') ;
      //
      // var categories = m.values.toList()[items]['categores'];
      //
      // Map s = categories[4];

      // s.forEach((key, value) {
      //   print('$key : $value');
      // });

      // print(m);

      // print(categories[0]);

      // print("================JSON DATA===============${categories}");
      // print(m.entries.map((e) => print(e)));

      // return s;
      // print("THIS IS RESPONSEb ${jsonData}");
      // print(response.body);
      // return responseB;

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
