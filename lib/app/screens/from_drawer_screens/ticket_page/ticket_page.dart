import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/widgets/custom_day_scroll.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/my_icons_icons.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const CustomText(
                textText: 'التذاكر', color: Colors.white, fontSize: 18),
            elevation: 0.r,
            backgroundColor: const Color(0xff6D2B70),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(MyIcons.ionic_ios_arrow_back),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      textAlign: TextAlign.center,
                      textText:
                          "وفرنا لكم قائمة بافضل الشركات والعروض لشراء تذاكر السفر وافضل الفنادق وبعض الخدمات المساعدة اثناء اقامتكم",
                      color: Colors.black,
                      fontSize: 14),
                  CustomButtonWithIcon(
                      height: 60,
                      width: 200,
                      icon: MyIcons.ticket,
                      text: "حجز تذكرة",
                      top: 10,
                      bottom: 30,
                      left: 0,
                      right: 0,
                      onTap: () {}),
                  const CustomDayScroll(dayText: "اليوم الأول"),
                ],
              ),
            ],
          )),
    );
  }
}
