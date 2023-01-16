import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomBottomSheet extends StatelessWidget {
  final void Function() bottomSheetOnPressed;

  const CustomBottomSheet({Key? key, required this.bottomSheetOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: Colors.transparent,
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 330.h,
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
                      margin:
                          EdgeInsets.only(top: 25.h, left: 30.w, right: 30.w),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            MyIcons.exit,
                            color: Color(0xffD4D4D4),
                          ))),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          const CustomText(
                              textText: 'نسيت كلمة المرور ؟',
                              color: Colors.black,
                              fontSize: 20),
                          SizedBox(
                            height: 41.h,
                          ),
                          Form(
                            child: const CustomTextFormField(
                              isObscure: false,
                                icon: MyIcons.message, hint: 'البريد الإلكتروني'),
                          ),
                          CustomButton(
                              onPressed: bottomSheetOnPressed,
                              bottomMargin: 37,
                              topMargin: 50,
                              height: 50,
                              width: 200,
                              text: 'ارسال',
                              rightMargin: 0,
                              leftMargin: 0)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
