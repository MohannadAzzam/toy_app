import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/data_source/ticket_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/widgets/ticket_page_custom_card.dart';

class CustomDayScroll extends StatelessWidget {
  final String dayText;
  const CustomDayScroll({Key? key, required this.dayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            child: CustomText(
                textAlign: TextAlign.start,
                textText: dayText,
                color: const Color(0xff911D74),
                fontSize: 20)),
        SizedBox(
          height: 500,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: ticketList.length,
            itemBuilder: (context, index) =>
                CustomTicketPageCard(ticket: ticketList[index]),
          ),
        ),
      ],
    );
  }
}
