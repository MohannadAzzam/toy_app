import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String hint;
  const CustomTextFormField({Key? key, required this.icon, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 60.h,
      width: 320.w,
      child: TextFormField(
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.only(top: 22.h,bottom: 22.h,right: 20.w),
            prefixIcon: const Icon(
              MyIcons.message,
              size: 16,
              color: Color(0xff911D74),
            ),
            hintText: hint ,
            hintStyle: GoogleFonts.cairo(fontSize: 18, color: Colors.black),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
