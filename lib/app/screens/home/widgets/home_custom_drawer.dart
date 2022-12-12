import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/auth/login/login_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class HomeCustomDrawer extends StatelessWidget {
  const HomeCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff6D2B70),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/home_drawer_uper.png')),
            Container(
              padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
              color: const Color(0xff622665),
              child: InkWell(
                onTap: (){
                  Get.to(()=>const LoginPage());

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.cairo(
                          fontSize: 18.sp, color: Colors.white),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    const Icon(
                      MyIcons.person,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25.h, right: 42.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الرئيسية',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.home,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'العارضين',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.store,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الرعاة',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.sponsors,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'التذاكر',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.ticket,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'السفر والقنادق',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.travelandhote,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'المدونة',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.blog,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'من نحن',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.info,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الأسئلة الشائعة',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.question_circle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'English',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.english,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 12.h, right: 42.w /*,bottom: 24*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'اتصل بنا',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        MyIcons.message,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 240.w,
                  padding: EdgeInsets.only(top: 44.h, bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23.r,
                          backgroundColor: const Color(0xff6D2B70),
                          child: const Icon(
                            MyIcons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23.r,
                          backgroundColor: const Color(0xff6D2B70),
                          child: const Icon(
                            MyIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23.r,
                          backgroundColor: const Color(0xff6D2B70),
                          child: const Icon(
                            MyIcons.twitter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23.r,
                          backgroundColor: const Color(0xff6D2B70),
                          child: const Icon(
                            MyIcons.linkedin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
