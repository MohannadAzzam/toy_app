import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/controllers/categories_controller.dart';
import 'package:toy_app/app/data/data_source/helper_list.dart';
import 'package:toy_app/app/data/data_source/home_new_blog_list.dart';
import 'package:toy_app/app/screens/home/widgets/custom_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_helper.dart';
import 'package:toy_app/app/screens/home/widgets/custom_new_blog_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_ticket_booking_card.dart';
import 'package:toy_app/app/screens/home/widgets/home_custom_drawer.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../data/data_source/Home_top_card_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff6D2B70),
      endDrawer: const HomeCustomDrawer(),
      appBar: AppBar(
        // centerTitle: true,
        // title: Text('الصفحة الرئيسية',style: TextStyle(fontFamily: 'din-next-lt-w23'),),
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
              icon: const Icon(
                MyIcons.menu,
                size: 32,
              ),
            );
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
                  const Image(
                      image: AssetImage('assets/images/home_page_up.png')),
                  Container(
                    margin: EdgeInsets.only(top: 150.h),
                    height: 130.h,
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
              Obx(

                      () => SizedBox(
                    width: Get.width,
                    height: 400.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return customTicketBookingCard(
                              categories:
                                  categoryController.categoryList[index]);
                        },
                        // separatorBuilder: (context, i) => const SizedBox(),
                        itemCount: categoryController.categoryList.length),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'المساعدة',
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            color: const Color(0xff911D74), fontSize: 20.sp),
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'سيسعد فريق المبيعات لدينا بالإجابة على أي\nأسئلة قد تكون لديك ومساعدتك في التسجيل',
                    style: GoogleFonts.cairo(
                      textStyle:
                          TextStyle(color: Colors.black, fontSize: 16.sp),
                    ),
                  )),
              SizedBox(
                // margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10),
                height: 234.h,
                width: Get.width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCustomHelper(customHelper: helperList[index]);
                    },
                    separatorBuilder: (context, i) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: helperList.length),
              ),
              Container(
                  margin: EdgeInsets.only(right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'جديد المدونة',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          color: const Color(0xff911D74),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 234.h,
                width: Get.width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomNewBlogCard(
                          homeNewBlog: homeNewBlogList[index]);
                    },
                    separatorBuilder: (context, i) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: homeNewBlogList.length),
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
