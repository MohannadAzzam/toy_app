import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class SponsorsCustomIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  const SponsorsCustomIconWithText({Key? key, required this.icon, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Icon(
            icon,
            size: 10.r,
            color: const Color(0xff911D74),
          ),
          SizedBox(
            width: 5.w,
          ),
          CustomText(textText: text, color: Colors.black, fontSize: fontSize.sp,fontWeight: FontWeight.w400,)
        ],
      ),
    );
  }
}
