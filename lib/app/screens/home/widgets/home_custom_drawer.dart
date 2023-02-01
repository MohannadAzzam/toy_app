import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:toy_app/app/controllers/locale/local_controller.dart';
import 'package:toy_app/app/screens/auth/login/login_page.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/blog_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/call_us_page/call_us_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/choose_package_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/travel_and_hotels_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/common_question_page/common_question_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/ticket_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/who_us/who_us_page.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/screens/home/widgets/custom_drawer_unit.dart';
import 'package:toy_app/app/screens/home/widgets/social_media_circle_icon.dart';
import 'package:toy_app/app/screens/profile/company_profile/company_profile_page.dart';
import 'package:toy_app/app/screens/profile/user_profile/user_profile_page.dart';
import 'package:toy_app/main.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../from_drawer_screens/sponsors_page/sponsors_page.dart';

class HomeCustomDrawer extends StatelessWidget {
  HomeCustomDrawer({Key? key}) : super(key: key);

  final MyLocalController _myLocalController = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff6D2B70),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                width: Get.width,
                height: 230.h,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                        image: AssetImage("assets/images/appLogo.png"),
                        height: 75),
                    CustomText(
                      textText: "RiyadhExhibition",
                      color: Color(0xff911D74),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      textText: "foChildrenGames",
                      color: Color(0xff949494),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )
                  ],
                )),
            // Image(
            //    image: AssetImage('assets/images/home_drawer_uper.png')),
            Container(
              padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
              color: const Color(0xff622665),
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  Get.to(() => const LoginPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        textText: "login", color: Colors.white, fontSize: 18),
                    SizedBox(
                      width: 6.w,
                    ),
                    const Icon(
                      MyIcons.person,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => HomePage());
                    },
                    unitName: "home",
                    unitIcon: MyIcons.home),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => SponsorsPage());
                    },
                    unitName: "exhibitors",
                    unitIcon: MyIcons.store),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const ChoosePackagePage());
                    },
                    unitName: "sponsor",
                    unitIcon: MyIcons.sponsors),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => TicketPage());
                    },
                    unitName: "ticket",
                    unitIcon: MyIcons.ticket),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => TravelAndHotelsPage());
                    },
                    unitName: "travelAndHotel",
                    unitIcon: MyIcons.travelandhote),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => BlogPage());
                    },
                    unitName: "blog",
                    unitIcon: MyIcons.blog),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const WhoUsPage());
                    },
                    unitName: "whoUs",
                    unitIcon: MyIcons.info),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => CommonQuestionPage());
                    },
                    unitName: "commonQuestions",
                    unitIcon: MyIcons.question_circle),
                CustomDrawerUnit(
                    onTap: () {
                      print("_myLocalController.initLang.toString() ${_myLocalController.initLang.toString()}");
                      // _englishController.changeLanguage();
                      sharedPreferences!.getString("lang")== "ar"
                          ? _myLocalController.changeLang("en")
                          : _myLocalController.changeLang("ar");
                      Get.offAll(() =>   HomePage());

                    },
                    unitName: "English",
                    unitIcon: MyIcons.english),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const CallUsPage());
                    },
                    unitName: "callUs",
                    unitIcon: MyIcons.message),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const UserProfilePage());
                    },
                    unitName: 'USER PROFILE',
                    unitIcon: MyIcons.message),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const CompanyProfilePage());
                    },
                    unitName: 'CO PROFILE',
                    unitIcon: MyIcons.message),
                Container(
                  width: 240.w,
                  padding: EdgeInsets.only(top: 44.h, bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SocialMediaCircleIcons(icon: MyIcons.facebook),
                      SocialMediaCircleIcons(icon: MyIcons.instagram),
                      SocialMediaCircleIcons(icon: MyIcons.twitter),
                      SocialMediaCircleIcons(icon: MyIcons.linkedin),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
