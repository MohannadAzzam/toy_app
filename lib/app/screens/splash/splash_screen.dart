import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000),
            () => Get.to(() => HomePage(),transition: Transition.fade
            )
    ,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/splash_image.png')),
            Text(
              'معرض الرياض',
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 30.sp),
                  color: const Color(0xff911D74),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'لألعـــــــاب الأطفــــــــــال',
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 20.sp),
                  color: const Color(0xff949494),
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
