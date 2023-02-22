import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/locale/local_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/home/widgets/custom_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_helper.dart';
import 'package:toy_app/app/screens/home/widgets/custom_new_blog_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_ticket_booking_card.dart';
import 'package:toy_app/app/screens/home/widgets/home_custom_drawer.dart';
import 'package:toy_app/main.dart';
import 'package:toy_app/my_icons_icons.dart';
import '../../data/data_source/Home_top_card_list.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // final HomeController _categoryController = Get.put(HomeController());
  MyLocalController myLocalController = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    String? myToken = sharedPreferences!.getString("token");
    return Scaffold(
      drawer: HomeCustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: Builder(builder: (context) {
          print("MyLocalController.l ${MyLocalController.locale}");
          if (MyLocalController.locale == "ar") {
            return IconButton(
              onPressed: () {
                // print(Get.deviceLocale);
                Scaffold.of(context).openDrawer();
              },
              icon: Transform(
                // angle: math.pi,
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: const Icon(
                  MyIcons.menu,
                  size: 32,
                ),
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                print(Get.deviceLocale);
                Scaffold.of(context).openDrawer();
              },
              icon: Transform(
                // angle: math.pi,
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi),
                child: const Icon(
                  MyIcons.menu,
                  size: 32,
                ),
              ),
            );
          }
        }),
        actions:  [
          InkWell(
              onTap: (){
                print("myToken ${sharedPreferences!.getString("token")}");
              },
              child:
          Image(image: AssetImage('assets/images/notification_icon.png')))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/home_page_up2.png')),
                    Container(
                      margin:
                          EdgeInsets.only(top: 45.h, left: 10.w, right: 10.w),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Image(
                            image: AssetImage("assets/images/appLogo.png"),
                            height: 60,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                              textText: "RiyadhExhibition",
                              color: Colors.white,
                              fontSize: 18),
                          SizedBox(
                            height: 3,
                          ),
                          CustomText(
                            textText: "foChildrenGames",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 150.h),
                  height: 130.h,
                  width: Get.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCard(
                            homeTopCardItems: homeTopCardList[index]);
                      },
                      itemCount: homeTopCardList.length),
                ),
              ],
            ),
            SizedBox(
              width: Get.width,
              height: 400.h,
              child: CustomTicketBookingCard(),
            ),
            Container(
                width: Get.width,
                margin: EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                // alignment: Alignment.bottomRight,
                child: const CustomText(
                  textText: "helping",
                  color: Color(0xff911D74),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Container(
                width: Get.width,
                margin: EdgeInsets.only(right: 12.w, left: 12.w),
                // alignment: Alignment.bottomRight,
                child: const CustomText(
                    textText: "subHelping", color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 225.h,
              width: Get.width,
              child: HomeCustomHelper(),
            ),
            Container(
                width: Get.width,
                margin: EdgeInsets.only(
                    right: 12.w, left: 12.w, top: 5.h, bottom: 5.h),
                // alignment: Alignment.bottomRight,
                child: const CustomText(
                  textText: "blogNews",
                  color: Color(0xff911D74),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 234.h,
              width: Get.width,
              child: CustomNewBlogCard(),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
