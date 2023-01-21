import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import '../../../data/models/home_response.dart';

// ignore: camel_case_types
class customTicketBookingCard extends StatelessWidget {
  final Categore categories;
  // final List<Categore?>? categories;
  // final HomeTicketBookingCard homeTicketBookingCardItems;

  const customTicketBookingCard(
      {Key? key, /*required this.homeTicketBookingCardItems,*/ required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.all(5),
        width: 317.7.w,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(
                  "${categories.image}"),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 175.h, right: 20.w),
              alignment: Alignment.topRight,
              child: CustomText(
                  textText:
                  "${categories.name}",
                  color: Colors.white,
                  fontSize: 20),
            ),
            Container(
                margin: EdgeInsets.only(right: 20.w,top: 5.h,bottom: 5.h),
                alignment: Alignment.topRight,
                child: CustomText(
                    textText:
                    "${categories.shortDetails}",
                    color: Colors.white,
                    fontSize: 18)
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20.w),
                      alignment: Alignment.topRight,
                      child: CustomText(
                          textText:
                          "${categories.details}",
                          color: Color(0xffC1C1C1),
                          fontSize: 14.sp))
                ],
              ),
            ),
            CustomButton(
                onPressed: () {},
                bottomMargin: 20,
                topMargin: 20,
                height: 60,
                width: 220,
                text: "احجز تذاكر",
                rightMargin: 60,
                leftMargin: 60)
          ],
        ),
      );
    //   Container(
    //   color: Colors.red,
    //   margin: const EdgeInsets.all(5),
    //   height: 400.h,
    //   // color: Colors.blue,
    //   width: 317.7.w,
    //   child: Stack(
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(20),
    //         child: Image(
    //           image: AssetImage("assets/images/Ticket_booking.png"),
    //           fit: BoxFit.cover,
    //           height: 400.h,
    //           width: 317.7.w,
    //         ),
    //       ),
    //       SizedBox(
    //         // alignment: Alignment.bottomRight,
    //         // margin: EdgeInsets.only(top: 180.h,right: 28.w),
    //         width: Get.width,
    //         child: Column(
    //           children: [
    //             Container(
    //               margin: EdgeInsets.only(top: 160.h, left: 176.w, right: 27.w),
    //               child: Text(
    //                 categories.name!,
    //                 style: GoogleFonts.cairo(
    //                     textStyle:
    //                         TextStyle(color: Colors.white, fontSize: 20.sp)),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(top: 5.h, left: 120.w, right: 27.w),
    //               child: Text(
    //                 categories.shortDetails!,
    //                 style: GoogleFonts.cairo(
    //                     textStyle:
    //                         TextStyle(color: Colors.white, fontSize: 18.sp)),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 17.w, right: 27.w),
    //               child: Text(
    //                 categories.details!,
    //                 style: GoogleFonts.cairo(
    //                     textStyle: TextStyle(
    //                   color: const Color(0xffC1C1C1),
    //                   fontSize: 14.sp,
    //                 )),
    //               ),
    //             ),
    //             Container(
    //               margin:
    //                   EdgeInsets.only(left: 60.w, right: 60.w, bottom: 20.h),
    //               decoration: BoxDecoration(
    //                   color: const Color(0xffA92F86),
    //                   border: Border.all(color: Colors.transparent),
    //                   borderRadius: BorderRadius.circular(10)),
    //               height: 60,
    //               width: 220,
    //               child: MaterialButton(
    //                 onPressed: () {},
    //                 child: Text(
    //                   'احجز تذاكر',
    //                   style: GoogleFonts.cairo(
    //                       textStyle:
    //                           TextStyle(color: Colors.white, fontSize: 20.sp)),
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
