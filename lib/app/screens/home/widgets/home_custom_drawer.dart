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
import 'package:toy_app/app/screens/profile/user_profile/user_profile_page.dart';
import 'package:toy_app/main.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../controllers/lougout_controller.dart';
import '../../../controllers/profile_data_controller.dart';
import '../../from_drawer_screens/sponsors_page/sponsors_page.dart';
import '../../profile/company_profile/company_profile_page.dart';
import '../../profile/sponsor_profile/sponsor_profile_page.dart';

class HomeCustomDrawer extends StatelessWidget {
  HomeCustomDrawer({Key? key}) : super(key: key);

  final ProfileDataController profileDataController =
      Get.put(ProfileDataController());
  final MyLocalController _myLocalController = Get.put(MyLocalController());
  final LogOutController _logOutController = Get.put(LogOutController());

  // final profileDataController = Get.put(ProfileDataController());

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
            Container(
              // padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
              color: const Color(0xff622665),
              child: sharedPreferences!.getInt('log') == 1
                  ? Container(
                      padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                      color: const Color(0xff622665),
                      child:
                          // sharedPreferences!.getInt('log') == 1 ?
                          InkWell(
                        onTap: () {
                          Scaffold.of(context).closeEndDrawer();
                          if (sharedPreferences!.getString('userType') == "1") {
                            Get.to(() => const UserProfilePage());
                          } else if (sharedPreferences!.getString('userType') == "2") {
                            Get.to(() => const CompanyProfilePage());
                          } else if (sharedPreferences!.getString('userType') ==
                              "3") {
                            Get.to(() => const SponsorProfilePage());
                          }

                          // sharedPreferences!.getString('userType') == "1"
                          //     ? Get.to(() => const UserProfilePage())
                          //     : Get.to(() => const CompanyProfilePage());
                          // : Get.to(() => const SponsorProfilePage());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: FutureBuilder(
                              future: profileDataController.getUserData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        // foregroundImage: Image.network('https://etr.hexacit.com/uploads/images/users/defualtUser.jpg'),
                                        backgroundColor: const Color(0xff6D2B70),
                                        backgroundImage: NetworkImage(
                                            snapshot.data!.image),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              textText:
                                              snapshot.data!.name,
                                              color: Colors.white,
                                              fontSize: 16),
                                          const CustomText(
                                              textText: 'profile',
                                              color: Color(0xffC1C1C1),
                                              fontSize: 14)
                                        ],
                                      ),
                                    ],
                                  );
                                }
                                return const Center(child: CircularProgressIndicator(),);
                              }),
                        ),
                      ),
                      // :
                    )
                  : InkWell(
                      onTap: () {
                        Scaffold.of(context).closeEndDrawer();
                        Get.to(() => const LoginPage());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              MyIcons.person,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            const CustomText(
                                textText: "login",
                                color: Colors.white,
                                fontSize: 18),
                          ],
                        ),
                      ),
                    ),
              // :
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

                      Get.to(() => const TicketPage());
                    },
                    unitName: "ticket",
                    unitIcon: MyIcons.ticket),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      Get.to(() => const TravelAndHotelsPage());
                    },
                    unitName: "travelAndHotel",
                    unitIcon: MyIcons.travelandhote),
                CustomDrawerUnit(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                      Get.to(() => const BlogPage());
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

                      Get.to(() => const CommonQuestionPage());
                    },
                    unitName: "commonQuestions",
                    unitIcon: MyIcons.question_circle),
                CustomDrawerUnit(
                    onTap: () {
                      // var ar = "ar";
                      // MyLocalController.getLanguageResponse(ar);
                      // print("getLanguageResponse(ar) ${MyLocalController.getLanguageResponse(ar)}");
                      // _englishController.changeLanguage();
                      if (sharedPreferences!.getString("lang") == "ar") {
                        _myLocalController.changeLang("en");
                      } else /*(sharedPreferences!.getString("lang")== "en")*/ {
                        _myLocalController.changeLang("ar");
                      }
                      // sharedPreferences!.getString("lang")== "ar"
                      //     ? _myLocalController.changeLang("en") ;
                      // sharedPreferences!.getString("lang")== "en"
                      //     ? _myLocalController.changeLang("ar");
                      Get.offAll(() => HomePage());
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
                      Get.back();
                      _logOutController.logOut();
                      sharedPreferences!.remove('log');
                      // sharedPreferences!.clear();
                      // Scaffold.of(context).closeEndDrawer();
                    },
                    unitName: 'LogOut',
                    unitIcon: MyIcons.message),
                // CustomDrawerUnit(
                //     onTap: () {
                //       Scaffold.of(context).closeEndDrawer();
                //       Get.to(() => const CompanyProfilePage());
                //     },
                //     unitName: 'CO PROFILE',
                //     unitIcon: MyIcons.message),
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
