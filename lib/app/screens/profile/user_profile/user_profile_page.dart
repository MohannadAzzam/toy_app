import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/screens/profile/user_profile/change_password_page.dart';
import 'package:toy_app/app/screens/profile/user_profile/edit_personal_details.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_tab_bar.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../controllers/profile_data_controller.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileDataController profileDataController =
        Get.put(ProfileDataController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.to(() => HomePage());
          },
          icon: const Icon(MyIcons.ionic_ios_arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(BottomSheet(
                    backgroundColor: Colors.transparent,
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        height: 250.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 25.h, left: 30.w, right: 30.w),
                                  child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        MyIcons.exit,
                                        color: Color(0xffD4D4D4),
                                      ))),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButtonWithIcon(
                                          height: 60,
                                          width: 294,
                                          icon: MyIcons.person,
                                          text: "تعديل البيانات الشخصية",
                                          top: 20,
                                          bottom: 10,
                                          left: 0,
                                          right: 0,
                                          onTap: () {
                                            Get.to(() => EditPersonalDetails());
                                          }),
                                      CustomButtonWithIcon(
                                          height: 60,
                                          width: 294,
                                          icon: MyIcons.locker,
                                          text: "تغيير كلمة المرور",
                                          top: 0,
                                          bottom: 10,
                                          left: 0,
                                          right: 0,
                                          onTap: () {
                                            Get.to(() => ChangePasswordPage());
                                          }),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: const Color(0xff6d2b70),
              height: 200.h,
              // margin: EdgeInsets.only(top: 8.h),
              width: Get.width,
              child: Center(
                  child: FutureBuilder(
                      future : profileDataController.getUserData(),
                      builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 55.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 54.r,
                          backgroundColor: const Color(0xff6D2B70),
                          backgroundImage: NetworkImage('${snapshot.data!.image}') ,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomText(
                          textText: 'الملف الشخصي',
                          color: Colors.white,
                          fontSize: 18),
                    ],
                  );
                }
                return Center(child: const CircularProgressIndicator(),);
              })),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: const CustomTabBar(),
            ) // DefaultTabController(
          ],
        ),
      ),
    );
  }
}
