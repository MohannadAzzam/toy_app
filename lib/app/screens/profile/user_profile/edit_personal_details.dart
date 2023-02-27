import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../controllers/edit_profile_controller.dart';
import '../../../controllers/profile_data_controller.dart';

class EditPersonalDetails extends StatelessWidget {
  EditPersonalDetails({Key? key}) : super(key: key);
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  final formState = GlobalKey<FormState>();
  final profileDataController = Get.put(ProfileDataController());

  validator() async {
    if (formState.currentState!.validate()) {
      await editProfileController.editProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(BottomSheet(
                    backgroundColor: Colors.transparent,
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        height: 250.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 25.h, left: 30.w, right: 30.w),
                                  child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        MyIcons.exit,
                                        color: Color(0xffD4D4D4),
                                      ))),
                              SizedBox(
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButtonWithIcon(
                                        height: 60,
                                        width: 294,
                                        icon: MyIcons.person,
                                        text: "تعديل البيانات الشخصية",
                                        top: 20,
                                        bottom: 10,
                                        left: 0,
                                        right: 0,
                                        onTap: () {}),
                                    CustomButtonWithIcon(
                                        height: 60,
                                        width: 294,
                                        icon: MyIcons.locker,
                                        text: "تغيير كلمة المرور",
                                        top: 0,
                                        bottom: 10,
                                        left: 0,
                                        right: 0,
                                        onTap: () {}),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: const Color(0xff6d2b70),
              height: 200.h,
              // margin: EdgeInsets.only(top: 8.h),
              width: Get.width,
              child: Center(
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 55.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 54.r,
                      backgroundColor: const Color(0xff6D2B70),
                      child: Icon(
                        MyIcons.person,
                        color: Colors.white,
                        size: 50.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomText(
                      textText: 'تعديل البيانات الشخصية',
                      color: Colors.white,
                      fontSize: 18),
                ],
              )),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
                key: formState,
                child: FutureBuilder(
                    future: profileDataController.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            CustomTextFormField(
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن ترك الاسم فارغ";
                                  }
                                  if (value.length < 5) {
                                    return "يجب ان يكون الاسم اطول من 5 حروف";
                                  }
                                  return null;
                                },
                                controller:
                                    editProfileController.nameController,
                                icon: MyIcons.person,
                                hint: snapshot.data!.name,
                                isObscure: false),
                            CustomTextFormField(
                                controller:
                                    editProfileController.emailController,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return "pleaseEnterYourEmail".tr;
                                  }
                                  if (!GetUtils.isEmail(value)) {
                                    return "thisIsNotEmail".tr;
                                  }
                                  return null;
                                },
                                icon: MyIcons.message,
                                hint: snapshot.data!.email,
                                isObscure: false),
                            CustomTextFormField(
                                controller:
                                    editProfileController.mobileController,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن ترك رقم الجوال فارغ";
                                  } else if (!GetUtils.isPhoneNumber(value)) {
                                    return "لا يمكن ترك الاسم فارغ";
                                  }
                                  return null;
                                },
                                icon: MyIcons.message,
                                hint: snapshot.data!.mobile,
                                isObscure: false),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
            CustomDropDownButtonFormField(onChange: (val) {
              if (val == "السعودية") {
                val = '1';
                // signUpController.userTypeController = val;
              } else if (val == 'الإمارات') {
                val = "2";
                // signUpController.userTypeController = val;
              } else if (val == 'مصر') {
                val = "3";
              }
              editProfileController.country = val;
            }),
            CustomButton(
                onPressed: () {
                  validator();
                },
                bottomMargin: 10,
                topMargin: 30,
                height: 60,
                width: 200,
                text: "حفظ",
                rightMargin: 0,
                leftMargin: 0)
          ],
        ),
      ),
    );
  }
}
