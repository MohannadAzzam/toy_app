import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toy_app/app/const/constants.dart';

import '../../main.dart';

class UpdateImageController extends GetxController {
  updateImage(ImageSource imageSource) async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${sharedPreferences!.getString('token')}"
    };

    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    File myFile = File(xFile!.path);
    var request =
        http.MultipartRequest("POST", Uri.parse("${baseApiLink}editProfile"))
          ..headers.addAll(headers);
    var length = await myFile.length();
    var stream = http.ByteStream(myFile.openRead());
    var multiPartFile = http.MultipartFile("image_profile", stream, length,
        filename: basename(myFile.path));
    request.files.add(multiPartFile);
    var myRequest = await request.send();
    // var response = http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      Get.snackbar("", "سيتم تغير الصورة خلال لحظات");
    } else {
      Get.snackbar("", "حدث خطأ اثناء تغيير الصورة");
    }
  }
}
