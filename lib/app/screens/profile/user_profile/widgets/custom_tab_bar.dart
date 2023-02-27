import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/data_source/profile_ticket_list.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_profile_data_unit.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_tickets_profile.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../../../controllers/profile_data_controller.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileDataController profileDataController =
        Get.put(ProfileDataController());
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                height: Get.height,
                child: TabBar(
                  labelStyle:
                      GoogleFonts.cairo(textStyle: TextStyle(fontSize: 18.sp)),
                  unselectedLabelColor: const Color(0xff949494),
                  indicatorColor: const Color(0xff911D74),
                  indicatorSize: TabBarIndicatorSize.label,
                  // isScrollable: true,
                  labelColor: const Color(0xff911D74),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 16.r,
                            MyIcons.ticket,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('التذاكر')
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MyIcons.person,
                            size: 16.r,
                            // color: Color(0xff911D74),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('الملف الشخصي')
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          body: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(
                    // margin: EdgeInsets.only(top: 20.h),
                    height: 290.h,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: profileTicketList.length,
                        itemBuilder: (context, index) {
                          return CustomProfileTicket(
                              profileTicket: profileTicketList[index]);
                        }),
                  ),
                  CustomButtonWithIcon(
                      onTap: () {
                        profileDataController.getUserData();
                      },
                      top: 15,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 50,
                      width: 200,
                      icon: MyIcons.ticket,
                      text: 'حجز تذكرة')
                ],
              ),
              FutureBuilder(
                  future: profileDataController.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          CustomProfileDataUnit(
                              icon: MyIcons.person,
                              text: snapshot.data!.name),
                          CustomProfileDataUnit(
                              icon: MyIcons.phone,
                              text: snapshot.data!.mobile),
                          CustomProfileDataUnit(
                              icon: MyIcons.message,
                              text: snapshot.data!.email),
                          CustomProfileDataUnit(
                              icon: MyIcons.location,
                              text: snapshot.data!.countryName),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ));
  }
}
