import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:toy_app/app/data/models/categories/categories.dart';

class CategoryController extends GetxController {
  var categoryList = <Categories>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  void fetchCategory() async {
    var category = await RemoteServices.getCategories();
    try {
      isLoading(true);
      if (category.isNotEmpty) {
        categoryList.addAll(category);
        // print("---------myLog------------${categoryList}");
      }
    } finally {
      isLoading(false);
    }
  }
}

class RemoteServices {
  static Future<List<Categories>> getCategories() async {
    var response =
        await http.get(Uri.parse("https://etr.hexacit.com/api/home"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      // print("JSON DATA ${jsonData}");
      return categoriesFromJson(jsonData);
    } else {
      return throw Exception(
          "=============Faild to load categories==============");
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
