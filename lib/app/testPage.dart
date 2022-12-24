import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/event_list.dart';
import 'package:toy_app/app/data/data_source/event_num_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/widgets/ticket_custom_card_content.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Row(
              children: [
                Container(
                  height: 500.h,
                  width: (Get.width) * (7 / 10),
                  // constraints:BoxConstraints.expand() ,
                  margin: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w, /*top: 50*/
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: CustomText(
                              textText: "اليوم الأول",
                              color: Color(0xff911D74),
                              fontSize: 20)),
                      SizedBox(
                        height: 25,
                      ),
                      Badge(
                        badgeColor: Color(0xff911D74),
                        padding: EdgeInsets.all(15),
                        badgeContent: Column(
                          children: [
                            CustomText(
                                textText: "10",
                                color: Colors.white,
                                fontSize: 16),
                            CustomText(
                                textText: "صباحاً",
                                color: Colors.white,
                                fontSize: 14),
                          ],
                        ),
                        position: BadgePosition.topEnd(top: -35, end: 10),
                        child: Card(
                          elevation: 3.r,
                          // clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            margin:
                            EdgeInsets.only(top: 15.h, left: 20.w, right: 15.w),
                            // height: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                const CustomText(
                                  textText: "انظلاق الفعاليات",
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  // color: Colors.red,
                                  height: 400,
                                  child: ListView.builder(
                                    itemCount: eventList.length,
                                    itemBuilder: (context, index) =>
                                        CustomCardContent(
                                          eventNum: eventNumList[index],
                                          event: eventList[index]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
