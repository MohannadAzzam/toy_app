import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/my_icons_icons.dart';

class TestPage extends StatelessWidget {
  final IconData icon;
  final String title;

  const TestPage({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.only(
                  top: 20.h, left: 39.w, right: 39.w, bottom: 16.h),
              // width: 126.w,
              height: 160.h,
              child: Column(
                children: [
                   CircleAvatar(
                    radius: 48,
                    backgroundColor: Color(0xff911D74),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      // color: Color(0xff911D74),
                      size: 48,
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(fontSize: 18.sp),
                        color: const Color(0xff911D74)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
