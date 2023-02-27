import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomProfileDataUnit extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomProfileDataUnit(
      {Key? key, required this.icon, required this.text})
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
            size: 14.r,
            color: const Color(0xff911D74),
          ),
          SizedBox(
            width: 4.w,
          ),
          CustomText(textText: text, color: Colors.black, fontSize: 16.sp)
        ],
      ),
    );
  }
}
