import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/screens/profile/widgets/custom_tab_bar.dart';
import 'package:toy_app/my_icons_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          /* title: const CustomText(
              textText: 'السفر والفنادق', color: Colors.white, fontSize: 18),*/
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const HomePage());
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: Color(0xff6d2b70),
                height: 200.h,
                // margin: EdgeInsets.only(top: 8.h),
                width: Get.width,
                child: Center(
                    child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 54.r,
                        backgroundColor: const Color(0xff6D2B70),
                        child: Icon(
                          MyIcons.person,
                          color: Colors.white,
                          size: 50.r,
                        ),
                      ),
                    ),
                    CustomText(
                        textText: 'الملف الشخصي',
                        color: Colors.white,
                        fontSize: 18),
                  ],
                )),
              ),
              Container(
                height: 500,
                color: Colors.blue,
                child: CustomTabBar(),
              ) // DefaultTabController(
              //
              //     length: 2, child: Column(children: [
              //       Container(
              //         height: 50,
              //         color: Colors.red,),
              //       Container(
              //         height: 100,
              //         color: Colors.blue,),
              // ],)
              //
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
