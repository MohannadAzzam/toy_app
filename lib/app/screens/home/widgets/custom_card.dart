import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/home_top_card.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  final HomeTopCard homeTopCardItems;

  const CustomCard({Key? key, required this.homeTopCardItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        // color: Colors.red,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h, left: 35.w, right: 35.w),
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
                margin: EdgeInsets.symmetric(horizontal: 7.w,vertical: 10.h),
                child: CustomText(
                    textText: homeTopCardItems.title,
                    color:const Color(0xff911D74),
                    fontSize: 20)

                ),
          ],
        ),
      ),
    );
  }
}
