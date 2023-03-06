import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CallUsIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double fontSize;

  const CallUsIconWithText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: Get.width,
      child: Row(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Icon(
            icon,
            size: 16.r,
            color: const Color(0xff911D74),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: CustomText(
              textText: text,
              color: color,
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
