
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/login_controller.dart';
import 'package:toy_app/app/screens/auth/account_type/account_type_page.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/main.dart';
import 'package:toy_app/my_icons_icons.dart';



class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final formState = GlobalKey<FormState>();


    LoginController loginController = Get.put(LoginController());


    validator() async {
      if (formState.currentState!.validate()) {
        await controller.loginWithEmail();
      }
    }

    // final LoginController loginController = Get.put(LoginController());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              color: Color(0xff6D2B70),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage("assets/images/appLogo.png"),
                    height: 100,
                  ),
                  CustomText(
                    textText: "RiyadhExhibition",
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    textText: "foChildrenGames",
                    color: Color(0xffD4D4D4),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            // Image(image: AssetImage('assets/images/login_uper.png')),
            Container(
                margin: EdgeInsets.only(
                    top: 30.h, right: 20.w, bottom: 18.h, left: 20.w),
                child: const CustomText(
                    textText: "login", color: Color(0xff6D2B70), fontSize: 20)),
            Form(
                key: formState,
                child: Column(
                  children: [
                    Container(
                      child: CustomTextFormField(
                          controller: controller.emailController,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "pleaseEnterYourEmail".tr;
                            }
                            if (!GetUtils.isEmail(value)) {
                              return "thisIsNotEmail".tr;
                            }
                            return null;
                          },
                          isObscure: false,
                          icon: MyIcons.message,
                          hint: "email"),
                    ),
                    // SizedBox(
                    //   height: 9.h,
                    // ),
                    CustomTextFormField(
                        controller: controller.passwordController,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "pleaseEnterYourPassword".tr;
                          }
                          if (value.length < 3) {
                            return "thePasswordShouldBeMoreThan8Char".tr;
                          }
                          return null;
                        },
                        isObscure: true,
                        icon: MyIcons.locker,
                        hint: "password"),
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
                      border: Border.all(color: const Color(0xffF0F0F0)),
                      shape: BoxShape.rectangle,
                    ),
                    child: GetBuilder<LoginController>(
                        builder: (con) => Checkbox(
                              checkColor: const Color(0xff1BBAA2),
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                              value: con.isChecked,
                              onChanged: (var value) {
                                con.isClicked(value);
                                // print(con.isChecked);
                                // loginController.isLogedIn = con.isChecked;
                              },
                            )),
                  ),
                  const CustomText(
                      textText: "rememberMe",
                      color: Colors.black,
                      fontSize: 12),
                ],
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  CustomButton(
                      onPressed: () async {
                        // var data = loginController.loginWithEmail();
                        // print("myDATA ${loginController.data['user']['name']}");
                        // loginController.isLogedIn == true ?
                        // loginController.isChecked == null ? loginController.isChecked = ture;
                        print(loginController.isChecked);
                        if(controller.isChecked==true){
                              loginController.isLogedIn = sharedPreferences!.setInt("log", 1);
                        }

                        validator();

                      },
                      leftMargin: 0,
                      rightMargin: 0,
                      bottomMargin: 10,
                      topMargin: 20,
                      height: 60,
                      width: 200,
                      text: "loginDO5OL"),
                  MaterialButton(
                      onPressed: () {
                        Get.bottomSheet(CustomBottomSheet(
                          bottomSheetOnPressed: () {
                            Get.bottomSheet(CustomImageBottomSheet(
                                onPressed: () {},
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/login_bottom_sheet.png')),
                                firstText: "forgetPassword",
                                secondText: "messageWillSendToEmailToVerify",
                                buttonText: "loginDO5OL"));
                          },
                        ));
                      },
                      child: const CustomText(
                          textText: "forgetPassword",
                          color: Color(0xff646464),
                          fontSize: 16)),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
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
                                textText: "don'tHaveAcc",
                                color: Color(0xff646464),
                                fontSize: 16),
                            CustomText(
                                textText: "register",
                                color: Colors.black,
                                fontSize: 16)
                          ],
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
