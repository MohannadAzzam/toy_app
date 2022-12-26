import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_viewer_account/widgets/text_form_field_suffix.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

class EditCompanyAccountPage extends StatelessWidget {
  const EditCompanyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'تعديل الحساب', color: Colors.white, fontSize: 18),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              const CustomTextFormField(
                  isObscure: false, icon: MyIcons.person, hint: 'الاسم'),
              const CustomTextFormField(
                  isObscure: false,
                  icon: MyIcons.message,
                  hint: 'البريد الإلكتروني'),
              const CustomTextFormField(
                  isObscure: false, icon: MyIcons.phone, hint: 'رقم الجوال'),
              const CustomTextFormField(
                  isObscure: false, icon: MyIcons.company, hint: 'اسم الشركة'),
              const CustomDropDownButtonFormField(),
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
              Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                  child: CustomTextFormField(
                      isObscure: false,
                      suffixWidget: TextFormFieldSuffex(onPressed: () {}),
                      icon: MyIcons.file,
                      hint: 'ملفات الشركة الرسمية')),
              const CustomTextFormField(
                  isObscure: true, icon: MyIcons.locker, hint: 'كلمة المرور'),
              const CustomTextFormField(
                  isObscure: true,
                  icon: MyIcons.locker,
                  hint: 'اعادة كلمة المرور'),
              const CustomTextFormField(
                  icon: MyIcons.facebook,
                  hint: "ضع رابط حسابك على الفيسبوك",
                  isObscure: false),
              const CustomTextFormField(
                  icon: MyIcons.instagram,
                  hint: "ضع رابط حسابك على الانستجرام",
                  isObscure: false),
              const CustomTextFormField(
                  icon: MyIcons.twitter,
                  hint: "ضع رابط حسابك على تويتر",
                  isObscure: false),
              const CustomTextFormField(
                  icon: MyIcons.linkedin,
                  hint: "ضع رابط حسابك على اللنكد ان",
                  isObscure: false),
  CustomButton(onPressed: (){}, bottomMargin: 15, topMargin: 15, height: 60, width: 200, text: "حفظ", rightMargin: 0, leftMargin: 0)
            ],
          ),
        ),
      ),
    );
  }
}
