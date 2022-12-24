import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/organizer.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/organizers/widgets/custom_services_list.dart';
import 'package:toy_app/app/screens/from_drawer_screens/organizers/widgets/organizers_custom_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomOrganizerCard extends StatelessWidget {
  final Organizer organizer;

  // final Services? services;

  const CustomOrganizerCard({
    Key? key,
    required this.organizer,
    /*this.services*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 310.h,
        // width: Get.width - 10,
        // constraints:BoxConstraints.expand() ,
        margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
        child: Card(
          elevation: 3.r,
          // clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            margin: const EdgeInsets.all(10),
            // height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ///////////////////////////////////////////////
                // ما يوجد بين التعليقات يحتاج لاضافته في الكلاسيز والليست لاحقاً
            /*    SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                          image: AssetImage("assets/images/diamond_sponsor.png")),
                      CustomText(
                          textText: "الراعي الماسي",
                          color: Colors.black,
                          fontSize: 16),
                    ],
                  ),
                ),*/
                ///////////////////////////////////////////////

                // :
                Row(
                  children: [
                    Image(image: AssetImage(organizer.avatar)),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                            textText: organizer.arabicName,
                            color: Colors.black,
                            fontSize: 18),
                        CustomText(
                            textText: organizer.englishName,
                            color: Colors.black,
                            fontSize: 18),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    OrganizersCustomIconWithText(
                        icon: MyIcons.phone,
                        text: organizer.phone,
                        fontSize: 14),
                    OrganizersCustomIconWithText(
                        icon: MyIcons.message,
                        text: organizer.email,
                        fontSize: 14),
                  ],
                ),
                CustomText(
                  textText: organizer.description,
                  color: Colors.black,
                  fontSize: 12,
                  // fontWeight: FontWeight.w400,
                ),
                const CustomText(
                    textText: "الخدمات",
                    color: Color(0xff911D74),
                    fontSize: 16),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: organizer.servicesList.length,
                      itemBuilder: (context, index) {
                        return CustomServicesList(
                            services: organizer.servicesList[index]);
                      }),
                ),
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
