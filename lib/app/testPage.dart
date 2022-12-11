import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class TestPage extends StatelessWidget {

  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 257.h,
          // color: Colors.blue,
          width: 349.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('assets/images/home_new_blog.png'),
                  fit: BoxFit.fill,
                  height: 257.h,
                  width: 349.w,
                ),
              ),
              Container(

                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160.h, left: 80.w, right: 16.w),
                      child: Text(
                        'معرض الرياض لألعاب الأطفال',
                        style: GoogleFonts.cairo(
                            textStyle:
                            TextStyle(color: Colors.white, fontSize: 20.sp)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h, left: 220.w, right: 16.w),
                      child: Text(
                        "22/04/2022",
                        style: GoogleFonts.cairo(
                            textStyle:
                            TextStyle(color: Colors.white, fontSize: 18.sp)),
                      ),
                    ),
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
