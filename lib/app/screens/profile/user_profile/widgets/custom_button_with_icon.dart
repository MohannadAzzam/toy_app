import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final String text;

  final double top;
  final double bottom;
  final double left;
  final double right;

  final void Function() onTap;

  const CustomButtonWithIcon(
      {Key? key,
      required this.height,
      required this.width,
      required this.icon,
      required this.text,
      required this.top,
      required this.bottom,
      required this.left,
      required this.right,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top.h, bottom: bottom.h, left: left.w, right: right.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xff911D74),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          height: height.h,
          width: width.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomText(textText: text, color: Colors.white, fontSize: 18)
            ],
          ),
        ),
      ),
    );
  }
}
