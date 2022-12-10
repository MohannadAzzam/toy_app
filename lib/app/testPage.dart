import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/data_source/Home_top_card_list.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class TestPage extends StatelessWidget {
  // final IconData icon;
  // final String title;

  const TestPage({
    Key? key,
    // required this.icon,
    // required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          height: 400.h,
          width: 317.7.w,
          child: Stack(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child : Image(
                    image: AssetImage('assets/images/home_page_up.png'),
                    fit: BoxFit.cover,
                    height: 400.h,
                    width: 317.7.w,
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.bottomRight,
                // margin: EdgeInsets.only(top: 180.h,right: 28.w),
                width: Get.width,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 130.h, left: 176.w, right: 27.w),
                      child: Text(
                        'معرض الرياض',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                color: Colors.white, fontSize: 20.sp)),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 5.h, left: 120.w, right: 27.w),
                      child: Text(
                        'لألعــــاب الأطفــــــــال',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                color: Colors.white, fontSize: 18.sp)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 17.w, right: 27.w),
                      child: Text(
                        'ها هو معرض الرياض لألعاب الأطفال قد انطلق   \nوهو يعدّ من أهم وامتع المعارض التي تقدمها\nالمملكة العربية السعودية',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                          color: Color(0xffC1C1C1),
                          fontSize: 14.sp,
                        )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 60.w, right: 60.w, bottom: 20.h),
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
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 20.sp)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
