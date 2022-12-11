import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/models/helpers.dart';
import 'package:toy_app/my_icons_icons.dart';

class HomeCustomHelper extends StatelessWidget {
  final Helper customHelper;

  const HomeCustomHelper({
    Key? key,
    required this.customHelper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10.h, left: 40.w, right: 40.w),
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage(customHelper.avatarImage),
              )),
          Container(
            margin: EdgeInsets.only(top: 2.h, left: 40.w, right: 40.w),
            child: Text(
              customHelper.name,
              style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h, left: 40.w, right: 40.w),
            child: Text(
              customHelper.hisWork,
              style: GoogleFonts.cairo(
                color: const Color(0xff949494),
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InkWell(
                child: Icon(
                  MyIcons.phone,
                  size: 16,
                  color: Color(0xff911D74),
                ),
              ),
              SizedBox(
                width: 70.w,
              ),
              const InkWell(
                child:
                    Icon(MyIcons.message, size: 16, color: Color(0xff911D74)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
