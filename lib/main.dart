import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_app/app/controllers/locale/local.dart';
import 'package:toy_app/app/controllers/locale/local_controller.dart';
import 'package:toy_app/app/controllers/login_controller.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'app/controllers/aboutUs_controller.dart';



SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
   MyLocalController myLocalController = Get.put(MyLocalController());
   LoginController loginController = Get.put(LoginController());
  Get.put(AboutUsController());

   return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            unselectedWidgetColor: Colors.grey, // <-- your color
          ),
          home: child,
          locale: myLocalController.initLang   ,
          translations: MyLocale(),
        );
      },
      child:
          // sharedPreferences!.getInt('log') == 1?
      HomePage()
     // : LoginPage()
     // TestPage()
     ,
    );
  }
}
