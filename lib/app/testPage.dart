import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/call_us_page/widgets/call_us_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

import 'screens/from_drawer_screens/sponsors_page/widgets/sponsors_custom_icon_with_text.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const loremIpsum =
        "يرتبط المستخدِم من قبل بحساب نشِط أو غير مفعَّل في AdSense.المستخدِم هو اسم المستخدِم البديل لمعلومات موجودة لتسجيل الدخول إلى AdSense. يمكن أن تكون معلومات تسجيل الدخول هذه مرتبطة بحساب AdSense المعنيّ، أو بحساب آخر في AdSense أو أحد تطبيقاته.لم يتمّ تفعيل AdSense في حساب G Suite للمستخدم. يمكنك التواصل مع مشرف G Suite لتفعيل AdSense.";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          // margin: EdgeInsets.all(50),
          child: Row(
            children: [
              Card(
                elevation: 3.r,
                clipBehavior: Clip.antiAlias,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                  margin: EdgeInsets.only(left: 3,right: 3,top: 10),
                  height: 265,
                  width: Get.width/2-16,
                  child: Column(
                    children: [
                      Stack(
                        textDirection: TextDirection.ltr,
                        children: [
                          Image(
                              image: AssetImage(
                                  "assets/images/sponsors_page_custom_card_image.png")),
                          Container(
                            padding:
                            EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                            margin: EdgeInsets.only(top: 3.h, left: 3.w),
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(15))
                              // borderRadius:
                            ),
                            child: Column(
                              children: [
                                CustomText(
                                    textText: 'المكان',
                                    color: Colors.black,
                                    fontSize: 8),
                                CustomText(
                                  textText: '245',
                                  color: Color(0xff911D74),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 15.h),
                              height: 50.h,
                              width: 50.h,
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/company_avatar.png'),

                              ),
                            ),)
                        ],
                      ),
                      CustomText(
                          textText: 'اسم العارض المشارك',
                          color: Colors.black,
                          fontSize: 16),
                      Container(
                        width: Get.width,
                        child: Column(
                          children: [
                            SponsorsCustomIconWithText(
                                icon: MyIcons.phone,
                                text: "966123456789+",
                                fontSize: 10),
                            SponsorsCustomIconWithText(
                                icon: MyIcons.message,
                                text: "Mail@Website.com",
                                fontSize: 10),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: CustomText(
                          textText:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا من مولد العربى..',
                          color: Colors.black,
                          fontSize: 10,
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(MyIcons.linkedin,color: Color(0xff911D74),size: 20,),
                            Icon(MyIcons.twitter,color: Color(0xff911D74),size: 20,),
                            Icon(MyIcons.instagram,color: Color(0xff911D74),size: 20,),
                            Icon(MyIcons.facebook,color: Color(0xff911D74),size: 20,),
                          ],),
                      )
                    ],
                  ),
                ),
              ),


            ],
          )
        ),
      ),
    );
  }
}
