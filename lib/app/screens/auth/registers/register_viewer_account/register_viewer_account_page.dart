import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_viewer_account/widgets/text_form_field_suffix.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/main.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../../controllers/signup_controller.dart';

// ignore: camel_case_types
class registerViewerAccountPage extends StatelessWidget {
  const registerViewerAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formState = GlobalKey<FormState>();

    SignUpController signUpController = Get.put(SignUpController());
    validator() {
      if (formState.currentState!.validate()) {
        signUpController.signUp();
      }
    }

    String? userType = sharedPreferences!.getString('userType');
    signUpController.userTypeController = userType;

    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  color: const Color(0xff6D2B70),
                  height: 223,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CircleAvatar(
                        radius: 51.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: const Color(0xff6D2B70),
                          child: const Icon(
                            MyIcons.store,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomText(
                          textText: 'انشاء حساب عارض',
                          color: Colors.white,
                          fontSize: 20)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Form(
              key: formState,
              child: Column(
                children: [
                  CustomTextFormField(
                      keyboardType: TextInputType.name,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك الاسم فارغ";
                        }
                        if (value.length < 5) {
                          return "يجب ان يكون الاسم اطول من 5 حروف";
                        }
                        return null;
                      },
                      controller: signUpController.nameController,
                      isObscure: false,
                      icon: MyIcons.person,
                      hint: 'الاسم'),
                  CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: signUpController.emailController,
                      isObscure: false,
                      icon: MyIcons.message,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "pleaseEnterYourEmail".tr;
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "thisIsNotEmail".tr;
                        }
                        return null;
                      },
                      hint: 'البريد الإلكتروني'),
                  CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك رقم الجوال فارغ";
                        } else if (!GetUtils.isPhoneNumber(value)) {
                          return "لا يمكن ترك الاسم فارغ";
                        }
                        return null;
                      },
                      controller: signUpController.mobileController,
                      isObscure: false,
                      icon: MyIcons.phone,
                      hint: 'رقم الجوال'),
                  CustomTextFormField(
                      keyboardType: TextInputType.name,

                      valid: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك اسم الشركة فارغ";
                        }
                        if (value.length < 5) {
                          return "يجب ان يكون اسم الشركة اطول من 5 حروف";
                        }
                        return null;
                      },
                      // controller: signUpController.countryIdController,
                      isObscure: false,
                      icon: MyIcons.company,
                      hint: 'اسم الشركة'),
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
                      signUpController.countryIdController = val;
                    },
                  ),
                  CustomTextFormField(
                      isObscure: false,
                      suffixWidget: TextFormFieldSuffex(onPressed: () {}),
                      icon: MyIcons.file,
                      hint: 'شعار الشركة'),
                  CustomTextFormField(
                      isObscure: false,
                      suffixWidget: TextFormFieldSuffex(onPressed: () {}),
                      icon: MyIcons.file,
                      hint: 'ملفات الشركة التعريفية'),
                  CustomTextFormField(
                      isObscure: false,
                      suffixWidget: TextFormFieldSuffex(onPressed: () {}),
                      icon: MyIcons.file,
                      hint: 'ملفات الشركة الرسمية'),
                  CustomTextFormField(
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك كلمة المرور فارغة";
                        } else if (value.length < 6) {
                          return "لا يمكن أن تكون كلمة المرور اقل من 6 حروف";
                        }
                        return null;
                      },
                      controller: signUpController.passwordController,
                      isObscure: true,
                      icon: MyIcons.locker,
                      hint: 'كلمة المرور'),
                  CustomTextFormField(
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك كلمة المرور فارغة";
                        } else if (value.length < 6) {
                          return "لا يمكن أن تكون كلمة المرور اقل من 6 حروف";
                        }
                        return null;
                      },
                      controller: signUpController.confirmPasswordController,
                      isObscure: true,
                      icon: MyIcons.locker,
                      hint: 'اعادة كلمة المرور'),
                ],
              ),
            ),
            CustomButton(
                onPressed: () {
                  validator();
                },
                bottomMargin: 20,
                topMargin: 40,
                height: 60,
                width: 200,
                text: 'تسجيل',
                rightMargin: 0,
                leftMargin: 0)
          ],
        ),
      ),
    );
  }
}
