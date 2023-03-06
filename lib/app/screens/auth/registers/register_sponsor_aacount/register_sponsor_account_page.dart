import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../../../main.dart';
import '../../../../controllers/signup_controller.dart';

class RegisterSponsorAccountPage extends StatelessWidget {
  const RegisterSponsorAccountPage({Key? key}) : super(key: key);

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

    var loading = false;

    return
      loading == true ? const Center(child: CircularProgressIndicator(),) :
      Scaffold(
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
                              MyIcons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const CustomText(
                            textText: 'انشاء حساب راعي',
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
                        controller: signUpController.nameController ,
                        keyboardType: TextInputType.name,

                        valid: (value) {
                          if (value!.length < 3) {
                            return "يجب أن يكون الاسم اكبر من 3 حروف";
                          } else if (value.isEmpty) {
                            return "لا يمكن ترك الاسم فارغ";
                          }
                          return null;
                        },
                        isObscure: false,
                        icon: MyIcons.person,
                        hint: 'الاسم'),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,

                        controller: signUpController.emailController,                        valid: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return "يجب أن يكون البريد الاكتروني صالح";
                      } else if (value.isEmpty) {
                        return "لا يمكن ترك البريد الإلكتروني فارغ";
                      }
                      return null;
                    },
                        isObscure: false,
                        icon: MyIcons.message,
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
                        isObscure: false,
                        icon: MyIcons.phone,
                        controller: signUpController.mobileController,
                        hint: 'رقم الجوال'),
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
                        controller: signUpController.passwordController,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "لا يمكن ترك كلمة المرور فارغة";
                          } else if (value.length < 6) {
                            return "لا يمكن أن تكون كلمة المرور اقل من 6 حروف";
                          }
                          return null;
                        },
                        isObscure: true,
                        icon: MyIcons.locker,
                        hint: 'كلمة المرور'),
                    CustomTextFormField(
                        controller: signUpController.confirmPasswordController,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "يجب كتابة كلمة المرور مرة أخرى";
                          } else if (value.length < 6) {
                            return "لا يمكن أن تكون كلمة المرور اقل من 6 حروف";
                          }
                          return null;
                        },
                        isObscure: true,
                        icon: MyIcons.locker,
                        hint: 'اعادة كلمة المرور'),
                  ],
                ),
              ),
              CustomButton(
                  onPressed: () {
                    loading = true;
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
