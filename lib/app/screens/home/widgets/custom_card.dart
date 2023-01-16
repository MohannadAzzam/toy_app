import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/models/home_top_card.dart';

class CustomCard extends StatelessWidget {
  final HomeTopCard homeTopCardItems;
  const CustomCard({Key? key, required this.homeTopCardItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Card(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, left: 39.w, right: 39.w),
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: const Color(0xff911D74),
              child: Icon(
                homeTopCardItems.image,
                color: Colors.white,
                size: 24.r,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(
              homeTopCardItems.title,
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 20.sp),
                  color: const Color(0xff911D74)),
            ),
          ),
        ],
      ),
    );
  }
}
