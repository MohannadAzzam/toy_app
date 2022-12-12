import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const bool value = true;
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
                      icon: MyIcons.message, hint: 'البريد الإلكتروني'),
                  SizedBox(
                    height: 9.h,
                  ),
                  const CustomTextFormField(
                      icon: MyIcons.locker, hint: 'كلمة المرور'),
                ],
              )),
              Container(
                margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 5.h),
                // color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      child: Checkbox(
                          checkColor: const Color(0xff1BBAA2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                  width: 0.5, color: Color(0xffF0F0F0)),
                            ),
                          ),
                          activeColor: Colors.white,
                          value: true,
                          onChanged: (bool) {
                            bool = !value;
                          }),
                    ),
                    const CustomText(
                        textText: 'تذكرني', color: Colors.black, fontSize: 16),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    CustomButton(
                        leftMargin: 0,
                        rightMargin: 0,
                        bottomMargin: 32,
                        topMargin: 20,
                        height: 60,
                        width: 200,
                        text: 'دخول'),
                    const CustomText(
                        textText: 'نسيت كلمة المرور؟',
                        color: Color(0xff646464),
                        fontSize: 16),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomText(
                              textText: 'ليس لديك حساب ؟',
                              color: Color(0xff646464),
                              fontSize: 16),
                          CustomText(
                              textText: 'انشاء حساب',
                              color: Colors.black,
                              fontSize: 16),

                        ],
                      ),
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
