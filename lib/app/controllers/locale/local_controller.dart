
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/main.dart';

class MyLocalController extends GetxController {

    Locale initLang = sharedPreferences!.getString("lang") ==  "ar" ?  Locale( "ar") :  Locale("en");
 // locale  ;
  // print("localeeeee $locale ");

   changeLang(String codeLang) {
     Locale  locale = Locale(codeLang);
    print("localeeeee $initLang ");
    sharedPreferences!.setString("lang", codeLang);
    Get.updateLocale(locale);
    update();
  }
}
