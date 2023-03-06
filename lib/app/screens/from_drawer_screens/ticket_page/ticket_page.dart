import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/ticket_page/widgets/ticket_page_custom_card.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/my_icons_icons.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: "ticket", color: Colors.white, fontSize: 18),
          elevation: 0.r,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(3),
                  child: const CustomText(
                      textAlign: TextAlign.center,
                      textText:"ticketUp",
                      color: Colors.black,
                      fontSize: 15),
                ),
                CustomButtonWithIcon(
                    height: 60,
                    width: 200,
                    icon: MyIcons.ticket,
                    text: "BookTickets",
                    top: 10,
                    bottom: 30,
                    left: 0,
                    right: 0,
                    onTap: () {
                      Get.snackbar('حجز تذكرة',"تم الحجز");
                    }),
                CustomTicketPageCard()
              ],
            ),
          ],
        ));
  }
}
