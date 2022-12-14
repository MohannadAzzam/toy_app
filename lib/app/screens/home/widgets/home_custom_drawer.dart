import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/auth/login/login_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
import 'package:toy_app/app/screens/home/widgets/custom_drawer_unit.dart';
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
            const Image(
                image: AssetImage('assets/images/home_drawer_uper.png')),
            Container(
              padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
              color: const Color(0xff622665),
              child: InkWell(
                onTap: () {
                  Get.to(() => const LoginPage());
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
                const SizedBox(
                  height: 13,
                ),
                const CustomDrawerUnit(
                    unitName: 'الرئيسية', unitIcon: MyIcons.home),
                 CustomDrawerUnit(
                  onTap: (){
                    Get.to(ChooseExhibitionLocationPage());
                  },
                    // nextPage: ChooseExhibitionLocationPage(),

                    unitName: 'العارضين',
                    unitIcon: MyIcons.store),
                const CustomDrawerUnit(
                    unitName: 'الرعاة', unitIcon: MyIcons.sponsors),
                const CustomDrawerUnit(
                    unitName: 'التذاكر', unitIcon: MyIcons.ticket),
                const CustomDrawerUnit(
                    unitName: 'السفر والفنادق',
                    unitIcon: MyIcons.travelandhote),
                const CustomDrawerUnit(
                    unitName: 'المدونة', unitIcon: MyIcons.blog),
                const CustomDrawerUnit(
                    unitName: 'من نحن', unitIcon: MyIcons.info),
                const CustomDrawerUnit(
                    unitName: 'الأسئلة الشائعة',
                    unitIcon: MyIcons.question_circle),
                const CustomDrawerUnit(
                    unitName: 'English', unitIcon: MyIcons.english),
                const CustomDrawerUnit(
                    unitName: 'اتصل بنا', unitIcon: MyIcons.message),
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
