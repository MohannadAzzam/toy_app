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
          height: 234.h,
          width: 173.w,
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10.h, left: 40.w, right: 40.w),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage:
                          AssetImage('assets/images/helper_avatar.png'),
                      // child: Image(
                      //   image: AssetImage('assets/images/helper_avatar.png'),
                      //   height: 94.h,
                      //   width: 94.w,
                      // ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 2.h, left: 40.w, right: 40.w),
                  child: Text(
                    'احمد محمد',
                    style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.h, left: 40.w, right: 40.w),
                  child: Text(
                    'مدير مبيعات',
                    style: GoogleFonts.cairo(
                      color: Color(0xff949494),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Icon(
                        MyIcons.phone,
                        size: 16,
                        color: Color(0xff911D74),
                      ),
                    ),
                    InkWell(
                      child: Icon(MyIcons.message,
                          size: 16, color: Color(0xff911D74)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
