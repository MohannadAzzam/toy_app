import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final Widget? suffixWidget;
  final bool isObscure;
  final TextEditingController? controller;

  final String? Function(String?)? valid;

  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.hint,
    this.suffixWidget,
    required this.isObscure,
    this.valid,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      // height: 60.h,
      width: 320.w,
      child: TextFormField(
        controller: controller,
        validator: valid,
        strutStyle: StrutStyle.fromTextStyle(TextStyle(
          fontFamily: 'din-next-lt-w23',
          color: Colors.black,
          fontSize: 16.sp,
        )),
        obscureText: isObscure,
        decoration: InputDecoration(
            suffixIcon: suffixWidget,
            // contentPadding: EdgeInsets.only(top: 22.h,bottom: 22.h,right: 20.w),
            prefixIcon: Icon(
              icon,
              size: 20,
              color: const Color(0xff911D74),
            ),
            labelText: hint.tr,
            labelStyle: TextStyle(
              fontFamily: 'din-next-lt-w23',
              color: Colors.black,
              fontSize: 16.sp,
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
