import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/auth/login/login_page.dart';
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
import 'package:toy_app/my_icons_icons.dart';

import '../../from_drawer_screens/sponsors_page/sponsors_page.dart';

class HomeCustomDrawer extends StatelessWidget {
  const HomeCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff6D2B70),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Image(
                image: AssetImage('assets/images/home_drawer_uper.png')),
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
                    Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.cairo(
                          fontSize: 18.sp, color: Colors.white),
                    ),
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

                      Get.to(() => const HomePage());
                    },
                    unitName: 'الرئيسية',
                    unitIcon: MyIcons.home),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const SponsorsPage());
                    },
                    unitName: 'العارضين',
                    unitIcon: MyIcons.store),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const ChoosePackagePage());
                    },
                    unitName: 'الرعاة',
                    unitIcon: MyIcons.sponsors),
                 CustomDrawerUnit(
                     onTap: () {
                       Scaffold.of(context).closeEndDrawer();

                       Get.to(() => const TicketPage());
                     },
                    unitName: 'التذاكر', unitIcon: MyIcons.ticket),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const TravelAndHotelsPage());
                    },
                    unitName: 'السفر والفنادق',
                    unitIcon: MyIcons.travelandhote),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const BlogPage());
                    },
                    unitName: 'المدونة',
                    unitIcon: MyIcons.blog),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const WhoUsPage());
                    },
                    unitName: 'من نحن', unitIcon: MyIcons.info),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const CommonQuestionPage());
                    },
                    unitName: 'الأسئلة الشائعة',
                    unitIcon: MyIcons.question_circle),
                const CustomDrawerUnit(
                    unitName: 'English', unitIcon: MyIcons.english),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const CallUsPage());
                    },
                    unitName: 'اتصل بنا',
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
