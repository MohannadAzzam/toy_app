import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/models/travel_and_hotels.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomCompanyName extends StatelessWidget {
  final TravelAndHotels travelAndHotels;

  const CustomCompanyName({Key? key, required this.travelAndHotels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.bottomSheet(CustomImageBottomSheet(
              onPressed: (){

              },
            image: CircleAvatar(
                radius: 51.r,
                backgroundColor: const Color(0xffF5F5F5),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage(travelAndHotels.companyAvatar),
                  radius: 49.r,
                  // backgroundColor: Colors.red,
                )),
            firstText: travelAndHotels.companyName,
            buttonText: 'حجز',
            optionalWidget: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  MyIcons.exit,
                  color: Color(0xffD4D4D4),
                )),
            secondText: '',
          ));
        },
        child: Container(
          // color: Colors.red,
          // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
          height: 165.h,
          padding: EdgeInsets.only(left: 3.w, right: 3.w /*,bottom: 3.h*/),
          width: 194.w,
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                SizedBox(
                  width: 170.w,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 51.r,
                          backgroundColor: const Color(0xffF5F5F5),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(travelAndHotels.companyAvatar),
                            radius: 49.r,
                            // backgroundColor: Colors.red,
                          )),
                      CustomText(
                          textText: travelAndHotels.companyName,
                          color: Colors.black,
                          fontSize: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ),
        ));
  }
}
