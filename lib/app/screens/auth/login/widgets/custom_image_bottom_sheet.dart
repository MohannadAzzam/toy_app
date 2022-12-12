import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomImageBottomSheet extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;
  final String buttonText;

  const CustomImageBottomSheet(
      {Key? key,
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
            height: 494.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                           Image(
                              image: AssetImage(
                                  image)),
                          SizedBox(
                            height: 10.h,
                          ),
                           CustomText(
                              textText: firstText,
                              color: Colors.black,
                              fontSize: 20),
                          SizedBox(
                            height: 5.h,
                          ),
                           CustomText(
                              textText:
                                  secondText,
                              color: Colors.black,
                              fontSize: 16),
                          CustomButton(
                              onPressed: () {},
                              bottomMargin: 37,
                              topMargin: 38,
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
