import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/sponsors/sponsors_data.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/sponsors_page/widgets/sponsors_custom_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class SponsorsCustomCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorsCustomCard({Key? key, required this.sponsor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      Container(
        // margin: const EdgeInsets.only(left: 1, right: 1, top: 10),
        child: Card(
      elevation: 3.r,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // child:
          Stack(
            textDirection: TextDirection.ltr,
            children: [
              Image(
                image: AssetImage(sponsor.sponsorImage),
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                margin: EdgeInsets.only(top: 3.h, left: 3.w),
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(15))
                    // borderRadius:
                    ),
                child: Column(
                  children: [
                    const CustomText(
                        textText: 'المكان', color: Colors.black, fontSize: 8),
                    CustomText(
                      textText: sponsor.placeNumber,
                      color: const Color(0xff911D74),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  height: 50.h,
                  width: 50.h,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(sponsor.avatar),
                  ),
                ),
              ),
            ],
          ),
          CustomText(
              textText: sponsor.sponsorName, color: Colors.black, fontSize: 14),

          Column(
            children: [
              SponsorsCustomIconWithText(

                  icon: MyIcons.phone, text: sponsor.phoneNumber, fontSize: 10),
              SponsorsCustomIconWithText(
                  icon: MyIcons.message, text: sponsor.email, fontSize: 10),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // height: 70,
                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                child: CustomText(
                  textText: sponsor.description, color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  MyIcons.linkedin,
                  color: Color(0xff911D74),
                  size: 20,
                ),
                Icon(
                  MyIcons.twitter,
                  color: Color(0xff911D74),
                  size: 20,
                ),
                Icon(
                  MyIcons.instagram,
                  color: Color(0xff911D74),
                  size: 20,
                ),
                Icon(
                  MyIcons.facebook,
                  color: Color(0xff911D74),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
