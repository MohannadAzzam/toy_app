import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final Widget? suffixWidget;
final bool isObscure;
  const CustomTextFormField({Key? key, required this.icon, required this.hint, this.suffixWidget, required this.isObscure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 10.h),
      height: 60.h,
      width: 320.w,
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: suffixWidget,
            // contentPadding: EdgeInsets.only(top: 22.h,bottom: 22.h,right: 20.w),
            prefixIcon:  Icon(
               icon,
              size: 16,
              color: const Color(0xff911D74),
            ),
            hintText: hint ,
            hintStyle: GoogleFonts.cairo(fontSize: 18, color: Colors.black),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
