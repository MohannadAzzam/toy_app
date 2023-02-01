import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/screens/auth/account_type/account_type_page.dart';



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
      child: AccountTypePage(),
    );
  }
}
