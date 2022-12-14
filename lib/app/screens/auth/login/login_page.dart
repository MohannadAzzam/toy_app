import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/home_controller.dart';
import 'package:toy_app/app/screens/auth/account_type/account_type_page.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.lazyPut(() => LoginController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const HomePage());
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/images/login_uper.png')),
              Container(
                  margin: EdgeInsets.only(top: 30.h, right: 20.w, bottom: 18.h),
                  child: const CustomText(
                      textText: 'تسجيل الدخول',
                      color: Color(0xff6D2B70),
                      fontSize: 20)),
              Form(
                  child: Column(
                children: [
                  const CustomTextFormField(
                      isObscure: false,
                      icon: MyIcons.message,
                      hint: 'البريد الإلكتروني'),
                  SizedBox(
                    height: 9.h,
                  ),
                  const CustomTextFormField(
                      isObscure: true,
                      icon: MyIcons.locker,
                      hint: 'كلمة المرور'),
                ],
              )),
              Container(
                margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.h,
                      width: 20.w,
                      margin: EdgeInsets.only(right: 9.w, left: 9.w, top: 5.h),
                      decoration: BoxDecoration(
                        // color : Colors.grey,
                        border: Border.all(color: const Color(0xffF0F0F0) ),
                        shape: BoxShape.rectangle,
                      ),
                      child:
                          GetBuilder
                            <LoginController>
                            (
                              builder: (con) => Checkbox(
                                    checkColor: const Color(0xff1BBAA2),
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                    value: con.isChecked,
                                    onChanged: (var value ) {
                                      con.isClicked(value);
                                    },
                                  )),

                      ),
                    const CustomText(
                        textText: 'تذكرني', color: Colors.black, fontSize: 12),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    CustomButton(
                        onPressed: () {},
                        leftMargin: 0,
                        rightMargin: 0,
                        bottomMargin: 32,
                        topMargin: 20,
                        height: 60,
                        width: 200,
                        text: 'دخول'),
                    MaterialButton(
                        onPressed: () {
                          Get.bottomSheet(CustomBottomSheet(
                            bottomSheetOnPressed: () {
                              Get.bottomSheet(const CustomImageBottomSheet(
                                  image: 'assets/images/login_bottom_sheet.png',
                                  firstText: 'نسيت كلمة المرورو ؟',
                                  secondText:
                                      'ستصل رسالة على البريد الإلكتروني لتفعيل الحساب',
                                  buttonText: 'دخول'));
                            },
                          ));
                        },
                        child: const CustomText(
                            textText: 'نسيت كلمة المرور؟',
                            color: Color(0xff646464),
                            fontSize: 16)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Get.to(() => const AccountTypePage());
                          },
                          child: Row(
                            children: const [
                              CustomText(
                                  textText: 'ليس لديك حساب ؟',
                                  color: Color(0xff646464),
                                  fontSize: 16),
                              CustomText(
                                  textText: ' انشاء حساب',
                                  color: Colors.black,
                                  fontSize: 16)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
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
