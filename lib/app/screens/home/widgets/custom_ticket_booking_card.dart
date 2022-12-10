import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/models/home_ticket_booking_card.dart';

class customTicketBookingCard extends StatelessWidget {
  final HomeTicketBookingCard homeTicketBookingCardItems;

  const customTicketBookingCard(
      {Key? key, required this.homeTicketBookingCardItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 400.h,
      width: 317.7.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(homeTicketBookingCardItems.image),
              fit: BoxFit.fill,
              height: 400.h,
              width: 317.7.w,
            ),
          ),
          Container(
            // alignment: Alignment.bottomRight,
            // margin: EdgeInsets.only(top: 180.h,right: 28.w),
            width: Get.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 130.h, left: 176.w, right: 27.w),
                  child: Text(
                    homeTicketBookingCardItems.firstTitle,
                    style: GoogleFonts.cairo(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 20.sp)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h, left: 120.w, right: 27.w),
                  child: Text(
                    homeTicketBookingCardItems.secondTitle,
                    style: GoogleFonts.cairo(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 18.sp)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17.w, right: 27.w),
                  child: Text(
                    homeTicketBookingCardItems.subTitle,
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                      color: Color(0xffC1C1C1),
                      fontSize: 14.sp,
                    )),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 60.w, right: 60.w, bottom: 20.h),
                  decoration: BoxDecoration(
                      color: Color(0xffA92F86),
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10)),
                  height: 60,
                  width: 220,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'احجز تذاكر',
                      style: GoogleFonts.cairo(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20.sp)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
