import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/screens/splash/splash_screen.dart';
import 'package:toy_app/app/testPage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context , child) {
        return GetMaterialApp(
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}