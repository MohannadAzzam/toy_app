import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/sponsor_packages_model.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomChoosePackageGrid extends StatelessWidget {
  final SponsorPackages sponsorPackages;
  const CustomChoosePackageGrid({Key? key, required this.sponsorPackages}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
      height: 190.h,
      padding: EdgeInsets.all(3),
      width: 170.w,
      child: Card(
        elevation: 3,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(left: 16.w, right: 15.w, top: 30.h),
              child:  CustomText(
                  textText: sponsorPackages.sponsorId, color: const Color(0xffC1C1C1), fontSize: 16),
            ),
            SizedBox(
              width: 170.w,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image:
                      AssetImage(sponsorPackages.sponsorImage)),
                  CustomText(
                      textText: sponsorPackages.sponsorName,
                      color: Colors.black,
                      fontSize: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
