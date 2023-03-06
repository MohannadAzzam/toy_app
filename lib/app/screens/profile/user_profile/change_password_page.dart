import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/change_password_controller.dart';
import 'package:toy_app/app/controllers/profile_data_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileDataController profileDataController =
        Get.put(ProfileDataController());
    ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());

    final formStatePassword = GlobalKey<FormState>();

    validator() async {
      if (formStatePassword.currentState!.validate()) {
        await changePasswordController.changePassword();
      }
    }
    // validator() async {
    //   if (formState.currentState!.validate()) {
    //     // await controller.loginWithEmail();
    //   }

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
          children: [
            Container(
              color: const Color(0xff6d2b70),
              height: 200.h,
              // margin: EdgeInsets.only(top: 8.h),
              width: Get.width,
              child: Center(
                  child: FutureBuilder(
                      future: profileDataController.getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 55.r,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 54.r,
                                  backgroundColor: const Color(0xff6D2B70),
                                  child: CircleAvatar(
                                    radius: 54.r,
                                    backgroundColor: const Color(0xff6D2B70),
                                    backgroundImage:
                                        NetworkImage(snapshot.data!.image),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomText(
                                  textText: 'تغير كلمة المرور',
                                  color: Colors.white,
                                  fontSize: 18),
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: formStatePassword,
              child: changePasswordController.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        CustomTextFormField(
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "لا يمكن ترك هذه الخانة فارغة";
                              }
                              return null;
                            },
                            controller:
                                changePasswordController.oldPasswordController,
                            icon: MyIcons.locker,
                            hint: 'كلمة المرور القديمة',
                            isObscure: true),
                        CustomTextFormField(
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "لا يمكن ترك هذه الخانة فارغة";
                              }
                              return null;
                            },
                            controller:
                                changePasswordController.newPasswordController,
                            icon: MyIcons.locker,
                            hint: 'كلمة المرور الجديدة',
                            isObscure: true),
                        CustomTextFormField(
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "لا يمكن ترك هذه الخانة فارغة";
                              }
                              return null;
                            },
                            controller: changePasswordController
                                .confirmNewPasswordController,
                            icon: MyIcons.locker,
                            hint: 'اعادة كلمة المرور الجديدة',
                            isObscure: true),
                      ],
                    ),

            ),
            CustomButton(
                onPressed: () async {
                  await validator();
                },
                bottomMargin: 10,
                topMargin: 30,
                height: 60,
                width: 200,
                text: "تغيير",
                rightMargin: 0,
                leftMargin: 0)
          ],
        ),
      ),
    );
  }
}
