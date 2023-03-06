import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_viewer_account/widgets/text_form_field_suffix.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../controllers/change_password_controller.dart';
import '../../../controllers/edit_profile_controller.dart';
import '../../../controllers/profile_data_controller.dart';

class EditCompanyAccountPage extends StatelessWidget {
  const EditCompanyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EditProfileController editProfileController =
        Get.put(EditProfileController());
    final formState = GlobalKey<FormState>();

    ProfileDataController profileDataController =
        Get.put(ProfileDataController());
    ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());
    validator() async {
      if (formState.currentState!.validate()) {
        await editProfileController.editProfile();
        changePasswordController.changePassword();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: 'تعديل الحساب', color: Colors.white, fontSize: 18),
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
            SizedBox(
              height: 15.h,
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
                                isObscure: false,
                                icon: MyIcons.person,
                                helperText: "بياناتك السابقة : ${snapshot.data!.name}",
                                hint: "name"),
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
                                isObscure: false,
                                icon: MyIcons.message,
                                helperText: "بياناتك السابقة : ${snapshot.data!.email}",
                                hint: "email"),
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
                                helperText: "بياناتك السابقة : ${snapshot.data!.mobile}",
                                isObscure: false,
                                icon: MyIcons.phone,
                                hint: "mobile"),
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
                                isObscure: false,
                                icon: MyIcons.company,
                                hint: "اسم الشركة"
                            ),
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
                            CustomTextFormField(
                                isObscure: false,
                                suffixWidget:
                                    TextFormFieldSuffex(onPressed: () {}),
                                icon: MyIcons.file,
                                hint: 'شعار الشركة'),
                            CustomTextFormField(
                                isObscure: false,
                                suffixWidget:
                                    TextFormFieldSuffex(onPressed: () {}),
                                icon: MyIcons.file,
                                hint: 'ملفات الشركة التعريفية'),
                            CustomTextFormField(
                                isObscure: false,
                                suffixWidget:
                                    TextFormFieldSuffex(onPressed: () {}),
                                icon: MyIcons.file,
                                hint: 'ملفات الشركة الرسمية'),
                            CustomTextFormField(
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن ترك هذه الخانة فارغة";
                                  }
                                  return null;
                                },
                                // controller:
                                // changePasswordController.oldPasswordController,
                                icon: MyIcons.locker,
                                controller: changePasswordController.oldPasswordController,
                                hint: 'كلمة المرور القديمة',
                                isObscure: false),
                            CustomTextFormField(
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن ترك كلمة المرور فارغة";
                                  } else if (value.length < 6) {
                                    return "لا يمكن أن تكون كلمة المرور اقل من 6 حروف";
                                  }
                                  return null;
                                },
                                isObscure: false,
                                icon: MyIcons.locker,
                                controller: changePasswordController.newPasswordController,

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
                                controller: changePasswordController.confirmNewPasswordController,

                                isObscure: false,
                                icon: MyIcons.locker,
                                hint: 'اعادة كلمة المرور'),
                            const CustomTextFormField(
                                keyboardType: TextInputType.url,

                                icon: MyIcons.facebook,
                                hint: "ضع رابط حسابك على الفيسبوك",
                                isObscure: false),
                            const CustomTextFormField(
                                keyboardType: TextInputType.url,

                                icon: MyIcons.instagram,
                                hint: "ضع رابط حسابك على الانستجرام",
                                isObscure: false),
                            const CustomTextFormField(
                                keyboardType: TextInputType.url,
                                icon: MyIcons.twitter,
                                hint: "ضع رابط حسابك على تويتر",
                                isObscure: false),
                            const CustomTextFormField(
                                keyboardType: TextInputType.url,
                                icon: MyIcons.linkedin,
                                hint: "ضع رابط حسابك على اللنكد ان",
                                isObscure: false),
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
                bottomMargin: 15,
                topMargin: 15,
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
