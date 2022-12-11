import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/data_source/helper_list.dart';
import 'package:toy_app/app/data/data_source/home_new_blog_list.dart';
import 'package:toy_app/app/data/data_source/home_ticket_booking_card_list.dart';
import 'package:toy_app/app/screens/home/widgets/custom_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_helper.dart';
import 'package:toy_app/app/screens/home/widgets/custom_new_blog_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_ticket_booking_card.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../data/data_source/Home_top_card_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff6D2B70),
      endDrawer: const Drawer(),
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
                              homeTopCardItems: HomeTopCardList[index]);
                        },
                        separatorBuilder: (context, i) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: HomeTopCardList.length),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                height: 400.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return customTicketBookingCard(
                          homeTicketBookingCardItems:
                              homeTicketBookingCardList[index]);
                    },
                    separatorBuilder: (context, i) => SizedBox(),
                    itemCount: homeTicketBookingCardList.length),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'المساعدة',
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            color: Color(0xff911D74), fontSize: 20.sp),
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
              Container(
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
                          color: Color(0xff911D74),
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
                      return CustomNewBlogCard(homeNewBlog: homeNewBlogList[index])
                      ;
                    },
                    separatorBuilder: (context, i) => SizedBox(
                      width: 8.w,
                    ),
                    itemCount: homeNewBlogList.length),
              ),SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}

// Widget CustomCard({required HomeTopCard homeTopCardItems}) =>
//
//     Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20.h, left: 39.w, right: 39.w),
//             child: CircleAvatar(
//               radius: 24.r,
//               backgroundColor: const Color(0xff911D74),
//               child: Icon(
//                 homeTopCardItems.image,
//                 color: Colors.white,
//                 size: 24.r,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 7.w),
//             child: Text(
//               homeTopCardItems.title,
//               style: GoogleFonts.cairo(
//                   textStyle: TextStyle(fontSize: 20.sp),
//                   color: const Color(0xff911D74)),
//             ),
//           ),
//         ],
//       ),
//     );

//
// Widget customTicketBookingCard(
//         {required HomeTicketBookingCard homeTicketBookingCardItems}) =>
//     Container(
//       height: 400.h,
//       width: 317.7.w,
//       child: Stack(
//         children: [
//           Image(
//             image: AssetImage(homeTicketBookingCardItems.image),
//           ),
//           Container(
//             // alignment: Alignment.bottomRight,
//             // margin: EdgeInsets.only(top: 180.h,right: 28.w),
//             width: Get.width,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 130.h, left: 176.w, right: 27.w),
//                   child: Text(
//                     homeTicketBookingCardItems.firstTitle,
//                     style: GoogleFonts.cairo(
//                         textStyle:
//                             TextStyle(color: Colors.white, fontSize: 20.sp)),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 5.h, left: 120.w, right: 27.w),
//                   child: Text(
//                     homeTicketBookingCardItems.secondTitle,
//                     style: GoogleFonts.cairo(
//                         textStyle:
//                             TextStyle(color: Colors.white, fontSize: 18.sp)),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 17.w, right: 27.w),
//                   child: Text(
//                     homeTicketBookingCardItems.subTitle,
//                     style: GoogleFonts.cairo(
//                         textStyle: TextStyle(
//                       color: Color(0xffC1C1C1),
//                       fontSize: 14.sp,
//                     )),
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.only(left: 60.w, right: 60.w, bottom: 20.h),
//                   decoration: BoxDecoration(
//                       color: Color(0xffA92F86),
//                       border: Border.all(color: Colors.transparent),
//                       borderRadius: BorderRadius.circular(10)),
//                   height: 60,
//                   width: 220,
//                   child: MaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       'احجز تذاكر',
//                       style: GoogleFonts.cairo(
//                           textStyle:
//                               TextStyle(color: Colors.white, fontSize: 20.sp)),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
