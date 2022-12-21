import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/blog_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/call_us_page/call_us_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/who_us/who_us_page.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/testPage.dart';

import 'app/screens/from_drawer_screens/common_question_page/common_question_page.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            unselectedWidgetColor: Colors.grey, // <-- your color
          ),
          home: child,
        );
      },
      child: const TestPage(),
    );
  }
}
