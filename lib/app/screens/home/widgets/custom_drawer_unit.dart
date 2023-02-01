import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomDrawerUnit extends StatelessWidget {
  // final Widget? nextPage;
  final String unitName;
  final IconData unitIcon;
  final void Function()? onTap;

  const CustomDrawerUnit(
      {Key? key,

      /*this.nextPage,*/

      required this.unitName,
      required this.unitIcon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap
      // (){
      // Get.to(()=> nextPage );
      // }
      ,
      child: Container(
        padding: EdgeInsets.only(top: 12.h, right: 42.w, left: 42.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              unitIcon,
              color: Colors.white,
              size: 14,
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(textText: unitName, color: Colors.white, fontSize: 16),
          ],
        ),
      ),
    );
  }
}
