import 'package:flutter/material.dart';

class CustomDayScroll extends StatelessWidget {
  final String dayText;
  const CustomDayScroll({Key? key, required this.dayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("OLD WIDGET");
    //   Column(
    //   children: [
    //     Container(
    //         alignment: AlignmentDirectional.topStart,
    //         margin: EdgeInsets.only(left: 10.w, right: 10.w),
    //         child: CustomText(
    //             textAlign: TextAlign.start,
    //             textText: dayText,
    //             color: const Color(0xff911D74),
    //             fontSize: 20)),
    //     Container(
    //       // color: Colors.red,
    //       padding: EdgeInsets.only(top: 10),
    //       height: 500,
    //       child: ListView.builder(
    //         physics: const BouncingScrollPhysics(),
    //         scrollDirection: Axis.horizontal,
    //         itemCount: ticketList.length,
    //         itemBuilder: (context, index) =>
    //             CustomTicketPageCard(ticket: ticketList[index]),
    //       ),
    //     ),
    //   ],
    // );
  }
}
