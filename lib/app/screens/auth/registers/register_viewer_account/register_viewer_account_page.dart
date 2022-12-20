import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/account_type/account_type_page.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_viewer_account/widgets/text_form_field_suffix.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
import 'package:toy_app/my_icons_icons.dart';

// ignore: camel_case_types
class registerViewerAccountPage extends StatelessWidget {
  const registerViewerAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const AccountTypePage());
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
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
              const CustomTextFormField(
                  isObscure: false,
                  icon: MyIcons.person, hint: 'الاسم'),
              const CustomTextFormField(
                  isObscure: false,
                  icon: MyIcons.message, hint: 'البريد الإلكتروني'),
              const CustomTextFormField(
                  isObscure: false,
                  icon: MyIcons.phone, hint: 'رقم الجوال'),
              const CustomTextFormField(
                  isObscure: false,
                  icon: MyIcons.company, hint: 'اسم الشركة'),
              const CustomDropDownButtonFormField(),
              CustomTextFormField(
                  isObscure: false,
                  suffixWidget:  TextFormFieldSuffex(onPressed: (){}) ,

                  icon: MyIcons.file,
                  hint: 'شعار الشركة'),
              CustomTextFormField(
                  isObscure: false,
                  suffixWidget:  TextFormFieldSuffex(onPressed: (){}) ,

                  icon: MyIcons.file,
                  hint: 'ملفات الشركة التعريفية'), Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                  child:  CustomTextFormField(
                      isObscure: false,
                      suffixWidget:  TextFormFieldSuffex(onPressed: (){}) ,

                      icon: MyIcons.file,
                      hint: 'ملفات الشركة الرسمية')),

              const CustomTextFormField(
                  isObscure: true,
                  icon: MyIcons.locker, hint: 'كلمة المرور'),
              const CustomTextFormField(
                  isObscure: true,
                  icon: MyIcons.locker, hint: 'اعادة كلمة المرور'),
              CustomButton(
                  onPressed: () {
                    Get.to(()=> ChooseExhibitionLocationPage() );
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
      ),
    );
  }
}
