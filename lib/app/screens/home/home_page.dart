import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/home/widgets/custom_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_helper.dart';
import 'package:toy_app/app/screens/home/widgets/custom_new_blog_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_ticket_booking_card.dart';
import 'package:toy_app/app/screens/home/widgets/home_custom_drawer.dart';
import 'package:toy_app/my_icons_icons.dart';
import '../../controllers/home_controller.dart';
import '../../data/data_source/Home_top_card_list.dart';
import 'dart:math' as math; // import this

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController categoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: HomeCustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: const Image(
            image: AssetImage('assets/images/notification_icon.png')),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi),
                  child: const Icon(
                    MyIcons.menu,
                    size: 32,
                  ),
                ));
          })
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Directionality(
          textDirection: TextDirection.rtl,
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
                            CustomText(
                                textText: "معرض الرياض",
                                color: Colors.white,
                                fontSize: 18),
                            CustomText(
                              textText: "لألعــــــــاب الأطفــــــــــــال",
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
                    margin: EdgeInsets.only(top: 150.h),
                    height: 110.h,
                    width: Get.width,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCard(
                              homeTopCardItems: homeTopCardList[index]);
                        },
                        separatorBuilder: (context, i) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: homeTopCardList.length),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width,
                height: 400.h,
                child: customTicketBookingCard(),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: const CustomText(
                    textText: "المساعدة",
                    color: Color(0xff911D74),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                  margin: EdgeInsets.only(right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: const CustomText(
                      textText:
                          "سيسعد فريق المبيعات لدينا بالإجابة على أي أسئلة قد تكون لديك ومساعدتك في التسجيل",
                      color: Colors.black,
                      fontSize: 18)),
              SizedBox(
                height: 225.h,
                width: Get.width,
                child: HomeCustomHelper(),
              ),
              Container(
                  margin: EdgeInsets.only(
                      right: 12.w, left: 12.w, top: 5.h, bottom: 5.h),
                  alignment: Alignment.bottomRight,
                  child: const CustomText(
                    textText: "جديد المدونة",
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
      ),
    );
  }
}
