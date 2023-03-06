import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';
import '../../../controllers/edit_profile_controller.dart';
import '../../../controllers/profile_data_controller.dart';
import '../../../controllers/update_image_controller.dart';
import '../update_profile_image.dart';

class EditPersonalDetails extends StatelessWidget {
  EditPersonalDetails({Key? key}) : super(key: key);
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  final formState = GlobalKey<FormState>();
  final profileDataController = Get.put(ProfileDataController());
  final updateImageController = Get.put(UpdateImageController());

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
                  const UpdateProfileImage(),
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
                                controller:
                                    editProfileController.nameController,
                                icon: MyIcons.person,
                                hint: "name",
                                helperText: "بياناتك السابقة : ${snapshot.data!.name}",

                                isObscure: false),
                            CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,

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
                                hint: "email",
                                helperText: "بياناتك السابقة : ${snapshot.data!.email}",
                                isObscure: false),
                            CustomTextFormField(
                                keyboardType: TextInputType.phone,

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
                                hint: "mobile",
                                helperText: "بياناتك السابقة : ${snapshot.data!.mobile}",
                                isObscure: false),
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
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),

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
