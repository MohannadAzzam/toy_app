import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/app/screens/from_drawer_screens/call_us_page/widgets/call_us_icon_with_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/call_us_page/widgets/custom_circle_avatar.dart';
import 'package:toy_app/app/screens/profile/widgets/custom_profile_data_unit.dart';
import 'package:toy_app/my_icons_icons.dart';

class CallUsPage extends StatelessWidget {
  const CallUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String string =
        "نعمل على راحتكم على مدار الساعه مع فريق دعم فني مميز لتسهيل جميع طلباتكم ومتابعه مراسلاتكم والرد باسرع وقت ممكن ويمكنك ايضا التواصل مع مدراء المبيعات لطلب التسيجل او الاستفسار وتسهيل التعاون معكم وتوفير جميع الخدمات باسلوب مميز وراقي. ";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'اتصل بنا', color: Colors.white, fontSize: 18),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.all(10),
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      textText: "بيانات التواصل",
                      color: Color(0xff911D74),
                      fontSize: 18),
                  CustomText(
                      textText: string, color: Colors.black, fontSize: 14),
                  const CallUsIconWithText(
                    icon: MyIcons.phone,
                    text: '966123456789+',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  const CallUsIconWithText(
                    icon: MyIcons.phone,
                    text: '966123456789+',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  const CallUsIconWithText(
                    icon: MyIcons.message,
                    text: "Mail@Website.com",
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  const CallUsIconWithText(
                    icon: MyIcons.location,
                    text: 'السعودية - الرياض - أرض المعارض',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  Container(
                    width: 240.w,
                    padding: EdgeInsets.only(top: 20.h, bottom: 28.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleAvatar(icon: MyIcons.linkedin),
                        CustomCircleAvatar(icon: MyIcons.twitter),
                        CustomCircleAvatar(icon: MyIcons.instagram),
                        CustomCircleAvatar(icon: MyIcons.facebook),
                      ],
                    ),
                  ),
                  const CustomText(
                      textText: "راسلنا",
                      color: Color(0xff911D74),
                      fontSize: 18),
                  CustomTextFormField(
                      icon: MyIcons.person, hint: 'الاسم', isObscure: false),
                  CustomTextFormField(
                      icon: MyIcons.message,
                      hint: 'البريد الإلكتروني',
                      isObscure: false),
                  CustomTextFormField(
                      icon: MyIcons.phone,
                      hint: 'رقم الجوال',
                      isObscure: false),
                  CustomDropDownButtonFormField(),
                  Container(
                    margin:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
                    height: 60.h,
                    width: 320.w,
                    child: TextFormField(
                      maxLines: 5,
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: "عنوان الرسالة",
                          hintStyle: GoogleFonts.cairo(
                              fontSize: 18, color: Colors.black),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
                    height: 200.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      maxLines: 10,
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: "عنوان الرسالة",
                          hintStyle: GoogleFonts.cairo(
                              fontSize: 18, color: Colors.black),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Center(
                    child: CustomButton(
                      width: 200,
                      height: 60,
                      bottomMargin: 10,
                      topMargin: 10,
                      leftMargin: 0,
                      rightMargin: 0,
                      text: "ارسال",
                      onPressed: () {},
                    ),
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