import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String textText;
  final Color color;
  final double fontSize;
  const CustomText({Key? key, required this.textText, required this.color, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textText,
      style: GoogleFonts.cairo(
          textStyle: TextStyle(color: color, fontSize: fontSize.sp)),
    );
  }
}
