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
import 'package:toy_app/my_icons_icons.dart';

import '../../../controllers/contactUs_controller.dart';

class CallUsPage extends StatelessWidget {
  const CallUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginController loginController = Get.put(LoginController());
    ContactUsController contactUsController = Get.put(ContactUsController());

    final formState = GlobalKey<FormState>();
    validator() async {
      if(formState.currentState!.validate()){
        contactUsController.contactUs();
      }
    }

    String string =
"callUsUp";
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: "callUs", color: Colors.white, fontSize: 18),
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(10),
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                  textText: "contactDetails",
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
                text: 'address',
                color: Colors.black,
                fontSize: 16,
              ),
              Container(
                width: 240.w,
                padding: EdgeInsets.only(top: 20.h, bottom: 28.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomCircleAvatar(icon: MyIcons.linkedin),
                    CustomCircleAvatar(icon: MyIcons.twitter),
                    CustomCircleAvatar(icon: MyIcons.instagram),
                    CustomCircleAvatar(icon: MyIcons.facebook),
                  ],
                ),
              ),
              const CustomText(
                  textText: "contactUs",
                  color: Color(0xff911D74),
                  fontSize: 18),
              Form(
                key: formState,
                child: Column(
                  children: [
                    CustomTextFormField(
                        keyboardType: TextInputType.name,

                        valid: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك الاسم فارغ";
                          } else if(value.length <5){
                            return "لا يمكن ان يكون الاسم اقل من 5 حروف";
                          }
                          return null;
                        },
                        controller: contactUsController.nameController,
                        icon: MyIcons.person,
                        hint: 'name',
                        isObscure: false),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,

                        valid: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك البريد الالكتروني فارغ";
                          } else if(!GetUtils.isEmail(value)){
                            return "هذا البريد الالكتروني غير صالح";
                          }
                          return null;
                        },
                        controller: contactUsController.emailController,

                        icon: MyIcons.message,
                        hint: 'email',
                        isObscure: false),
                    CustomTextFormField(
                        keyboardType: TextInputType.phone,

                        valid: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك رقم الجوال فارغ";
                          } else if(!GetUtils.isPhoneNumber(value)){
                            return "رقم الجوال هذا غير صالح";
                          }
                          return null;
                        },
                        controller: contactUsController.mobileController,

                        icon: MyIcons.phone,
                        hint: "mobile",
                        isObscure: false),
                    CustomDropDownButtonFormField(
                      onChange: (val) {
                        if (val == "السعودية") {
                          val = '1';
                          // print(val);
                          // signUpController.userTypeController = val;
                        } else if (val == 'الإمارات') {
                          val = "2";
                          // print(val);
                          // signUpController.userTypeController = val;
                        } else if (val == 'مصر') {
                          val = "3";
                          // print(val);
                        }
                        contactUsController.countryController = val;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 10.h),
                      height: 60.h,
                      width: 320.w,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك عنوان الرسالة فارغ";
                          } else if(value.length < 5){
                            return "يجب ان يكون عوان الرسالة اكبر من 5 حروف";
                          }
                          return null;
                        },
                        controller: contactUsController.messageTitleController,

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
                      margin: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 10.h),
                      height: 200.h,
                      width: 320.w,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك نص الرسالة فارغ";
                            } else if(value.length < 10){
                              return "يجب ان يكون نص الرسالة اكبر من 10 حرف";
                          }
                          return null;
                        },
                        controller: contactUsController.messageTextController,
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
                    // CustomTextFormField(icon: MyIcons.phone, hint: "عنوان الرسالة", isObscure: false )
                  ],
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
                  onPressed: () {
                    validator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
