import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String textText;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomText(
      {Key? key,
      required this.textText,
      required this.color,
      required this.fontSize,
      this.textAlign,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // maxLines: 50,

      textAlign: textAlign,
      // TextAlign: Alignment.center,
      textText,
      style:       TextStyle(fontFamily: 'din-next-lt-w23',color: color,fontSize: fontSize.sp,fontWeight: fontWeight)
,
      //   GoogleFonts.cairo(
      //     textStyle: TextStyle(
      //         color: color,
      //         fontSize: fontSize.sp,
      //         fontWeight: fontWeight
      //     )
      // ),
    );
  }
}
