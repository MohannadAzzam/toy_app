import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  final double bottomMargin;
  final double topMargin;
  final double rightMargin;
  final double leftMargin;
  final double height;
  final double width;
  final String text;

  CustomButton(
      {Key? key,
       required this.onPressed,
      required this.bottomMargin,
      required this.topMargin,
      required this.height,
      required this.width,
      required this.text,
      required this.rightMargin,
      required this.leftMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: bottomMargin.h,
          top: topMargin.h,
          left: leftMargin.w,
          right: rightMargin.w),
      child: MaterialButton(
        elevation: 0,
        minWidth: width.w,
        height: height.h,
        color:  Color(0xffA92F86),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: CustomText(
          color: Colors.white,
          fontSize: 20,
          textText: text,
        ),
      ),
    );
  }
}
