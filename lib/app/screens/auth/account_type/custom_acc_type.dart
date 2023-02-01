import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/widgets/custom_text.dart';

class CustomAccType extends StatelessWidget {
  final String image, name;
  final IconData icon;

  const CustomAccType(
      {Key? key, required this.image, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 222.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Icon(
              icon,
              size: 30.r,
              color: Colors.white,
            ),
          ),
          CustomText(textText: name, color: Colors.white, fontSize: 18)
        ],
      ),
    );
  }
}
