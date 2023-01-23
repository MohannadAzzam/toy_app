import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/event_list.dart';
import 'package:toy_app/app/data/data_source/event_num_list.dart';
import 'package:toy_app/app/data/models/ticket.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/widgets/ticket_custom_card_content.dart';

class CustomTicketPageCard extends StatelessWidget {
  final Ticket ticket;

  const CustomTicketPageCard({Key? key, required this.ticket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.width) * (7 / 10),
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w, /*top: 50*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Badge(
            badgeColor: Color(0xff911D74),
            padding: EdgeInsets.all(20),
            badgeContent: Column(
              children: [
                CustomText(
                    textText: ticket.timeNumber,
                    color: Colors.white,
                    fontSize: 16),
                CustomText(
                    textText: ticket.timeText,
                    color: Colors.white,
                    fontSize: 14),
              ],
            ),
            position: BadgePosition.topEnd(top: -25.h, end: 10.w),
            child: Card(
              elevation: 3.r,
              // clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: EdgeInsets.only(top: 15.h, left: 20.w, right: 15.w),
                // height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textText: ticket.eventName,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      // color: Colors.red,
                      height: 370,
                      child: ListView.builder(
                        physics: FixedExtentScrollPhysics(),
                        itemCount: eventList.length,
                        itemBuilder: (context, index) => CustomCardContent(
                            eventNum: eventNumList[index],
                            event: eventList[index]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
