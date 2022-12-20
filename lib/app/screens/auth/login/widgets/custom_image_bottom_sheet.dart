import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';

import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomImageBottomSheet extends StatelessWidget {
  final Widget image;
  final String firstText;
  final String secondText;
  final String buttonText;
  final Widget? optionalWidget;

  const CustomImageBottomSheet(
      {Key? key,
      this.optionalWidget,
      required this.image,
      required this.firstText,
      required this.secondText,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: Colors.transparent,
        onClosing: () {},
        builder: (context) {
          return Container(
            // height: 494.h,
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
                    margin: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                    child: optionalWidget,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          image,
                          CustomText(
                              textText: firstText,
                              color: Colors.black,
                              fontSize: 18),
                          CustomText(
                              textText: secondText,
                              color: Colors.black,
                              fontSize: 16),
                          CustomButton(
                              onPressed: () {},
                              bottomMargin: 30,
                              topMargin: 15,
                              height: 60,
                              width: 200,
                              text: buttonText,
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
