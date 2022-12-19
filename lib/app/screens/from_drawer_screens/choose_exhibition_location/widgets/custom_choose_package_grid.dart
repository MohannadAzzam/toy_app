import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/models/sponsor_packages_model.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomChoosePackageGrid extends StatelessWidget {
  final SponsorPackages sponsorPackages;

  const CustomChoosePackageGrid({Key? key, required this.sponsorPackages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(sponsorPackages.sponsorId);
        Get.bottomSheet(CustomImageBottomSheet(
          image: '${sponsorPackages.sponsorImage}',
          firstText: '${sponsorPackages.sponsorName}',
          secondText: ' لقد اخترت ان تكون ${sponsorPackages.sponsorName}',
          buttonText: 'حجز',
          optionalWidget: Container(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  MyIcons.exit,
                  color: Color(0xffD4D4D4),
                )),
          ),
        ));
        // );
      },
      child: Container(
        // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
        height: 190.h,
        padding: EdgeInsets.only(left: 3.w, right: 3.w /*,bottom: 3.h*/),
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
                child: CustomText(
                    textText: '${sponsorPackages.sponsorId}',
                    color: const Color(0xffC1C1C1),
                    fontSize: 16),
              ),
              SizedBox(
                width: 170.w,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(sponsorPackages.sponsorImage)),
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
      ),
    );
  }
}
