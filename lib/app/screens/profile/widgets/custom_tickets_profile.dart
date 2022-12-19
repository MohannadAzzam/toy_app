import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/profile_ticket.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomProfileTicket extends StatelessWidget {
  final ProfileTicket profileTicket;
  const CustomProfileTicket({Key? key, required this.profileTicket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only( right: 5, left: 5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: 56.w,
            height: 56.h,
            child: Icon(
              MyIcons.ticket,
              size: 40.r,
              color: Color(0xff911D74),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  textText:"${profileTicket.ticketName}" ,

                  color: Colors.black,
                  fontSize: 18),
              CustomText(
                  textText: '${profileTicket.ticketDate}',
                  color: Color(0xffC1C1C1),
                  fontSize: 16)
            ],
          )
        ],
      ),
    );
  }
}
