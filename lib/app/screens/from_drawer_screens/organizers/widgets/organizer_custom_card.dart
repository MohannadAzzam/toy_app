import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/organizers/widgets/organizers_custom_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomOrganizerCard extends StatelessWidget {
  const CustomOrganizerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Container(
        height: 310.h,
        width: Get.width - 10,
        // constraints:BoxConstraints.expand() ,
        margin: const EdgeInsets.only(
          /*left: 10, right: 10,*/
            top: 100),
        child: Card(
          elevation: 3.r,
          // clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            margin: EdgeInsets.all(10),
            // height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // child:
                Container(
                  // width: 100,
                  // margin: EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                  child: Row(
                    children: [
                      Image(
                          image: AssetImage(
                              "assets/images/organizers_avatar.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              textText: "تـيم واي",
                              color: Colors.black,
                              fontSize: 18),
                          CustomText(
                              textText: "TEAM WAY",
                              color: Colors.black,
                              fontSize: 18),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      OrganizersCustomIconWithText(
                          icon: MyIcons.phone,
                          text: "966123456789+",
                          fontSize: 14),
                      OrganizersCustomIconWithText(
                          icon: MyIcons.message,
                          text: "Mail@Website.com",
                          fontSize: 14),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: CustomText(
                    textText:
                    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا من مولد العربى..",
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400,
                  ),
                ),
                CustomText(
                    textText: "الخدمات",
                    color: Color(0xff911D74),
                    fontSize: 16),
                CustomText(
                    textText: "-تنظيم العرض",
                    color: Colors.black,
                    fontSize: 16),
                CustomText(
                    textText: "-تنظيم العرض",
                    color: Colors.black,
                    fontSize: 16),

                Container(
                  margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
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
          ),
        ));
  }
}
