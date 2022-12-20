import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/data/data_source/profile_ticket_list.dart';
import 'package:toy_app/app/screens/profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/app/screens/profile/widgets/custom_profile_data_unit.dart';
import 'package:toy_app/app/screens/profile/widgets/custom_tickets_profile.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
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
                          Text('التذاكر')
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
                          Text('الملف الشخصي')
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
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 230.h,
                    child: ListView.builder(
                        itemCount: profileTicketList.length,
                        itemBuilder: (context, index) {
                          return CustomProfileTicket(
                              profileTicket: profileTicketList[index]);
                        }),
                  ),
                  CustomButtonWithIcon(
                    onTap: (){

                    },
                      top: 40,
                      bottom: 20,
                      left: 0,
                      right: 0,
                      height: 60,
                      width: 200,
                      icon: MyIcons.ticket,
                      text: 'حجز تذكرة')
                ],
              ),
              Column(
                children: const [
                  CustomProfileDataUnit(
                      icon: MyIcons.person, text: 'محمد عبد الله احمد'),
                  CustomProfileDataUnit(
                      icon: MyIcons.phone, text: '966123456789+'),
                  CustomProfileDataUnit(
                      icon: MyIcons.message, text: 'Mail@Website.com'),
                  CustomProfileDataUnit(
                      icon: MyIcons.location, text: 'السعودية'),
                ],
              )
            ],
          ),
        ));
  }
}
