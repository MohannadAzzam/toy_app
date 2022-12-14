import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: EdgeInsets.only(top: 12.h, right: 42.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              unitName,
              style: GoogleFonts.cairo(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              unitIcon,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
