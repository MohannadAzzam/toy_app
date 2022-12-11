import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/models/home_new_blog.dart';

class CustomNewBlogCard extends StatelessWidget {
  final HomeNewBlog homeNewBlog;
  const CustomNewBlogCard({Key? key, required this.homeNewBlog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 257.h,
        // color: Colors.blue,
        width: 349.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(homeNewBlog.image),
                fit: BoxFit.fill,
                height: 257.h,
                width: 349.w,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150.h, left: 80.w, right: 20.w),
                  // color: Colors.red,
                  child: Text(
                    homeNewBlog.title,
                    style: GoogleFonts.cairo(
                        textStyle:
                        TextStyle(color: Colors.white, fontSize: 20.sp)),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 3.h, left: 235.w, right: 20.w,bottom: 11),
                  child: Text(
                    homeNewBlog.date,
                    style: GoogleFonts.cairo(
                        textStyle:
                        TextStyle(color: const Color(0xffC1C1C1), fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
