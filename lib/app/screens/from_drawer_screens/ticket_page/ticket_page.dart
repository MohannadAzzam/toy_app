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
                        textText:
                            "وفرنا لكم قائمة بافضل الشركات والعروض لشراء تذاكر"
                            " السفر وافضل الفنادق وبعض الخدمات المساعدة اثناء اقامتكم",
                        color: Colors.black,
                        fontSize: 15),
                  ),
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
                  CustomTicketPageCard()
                  // FutureBuilder(
                  //     future: _ticketController.fetchItemEvent(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Column(
                  //           children: [
                  //             Container(
                  //               padding: const EdgeInsets.only(top: 10),
                  //               height: 500,
                  //               child: ListView.builder(
                  //                   physics: const BouncingScrollPhysics(),
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemCount: snapshot.data!.length,
                  //                   itemBuilder: (context, index) {
                  //                     return Column(
                  //                       children: [
                  //                         Container(
                  //                             width: (Get.width) * (7 / 10),
                  //                             alignment:
                  //                                 AlignmentDirectional.topStart,
                  //                             margin: EdgeInsets.only(
                  //                                 left: 10.w, right: 10.w),
                  //                             child: CustomText(
                  //                                 textAlign: TextAlign.start,
                  //                                 textText: snapshot
                  //                                     .data![index].name,
                  //                                 color:
                  //                                     const Color(0xff911D74),
                  //                                 fontSize: 20)),
                  //                         Container(
                  //                           width: (Get.width) * (7 / 10),
                  //                           margin: EdgeInsets.only(
                  //                             left: 10.w,
                  //                             right: 10.w,
                  //                           ),
                  //                           child: Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               const SizedBox(
                  //                                 height: 25,
                  //                               ),
                  //                               Badge(
                  //                                 badgeColor:
                  //                                     const Color(0xff911D74),
                  //                                 padding:
                  //                                     const EdgeInsets.all(20),
                  //                                 badgeContent: Column(
                  //                                   children: [
                  //                                     CustomText(
                  //                                         textText: snapshot
                  //                                             .data![index]
                  //                                             .events[index]
                  //                                             .time
                  //                                             .substring(0, 5),
                  //                                         color: Colors.white,
                  //                                         fontSize: 16),
                  //                                   ],
                  //                                 ),
                  //                                 position:
                  //                                     BadgePosition.topEnd(
                  //                                         top: -25.h,
                  //                                         end: 10.w),
                  //                                 child: Card(
                  //                                   elevation: 3.r,
                  //                                   // clipBehavior: Clip.antiAlias,
                  //                                   shape:
                  //                                       RoundedRectangleBorder(
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .circular(
                  //                                                       15)),
                  //                                   child: Container(
                  //                                     margin: EdgeInsets.only(
                  //                                         top: 15.h,
                  //                                         left: 20.w,
                  //                                         right: 15.w),
                  //                                     // height: 500,
                  //                                     child: Column(
                  //                                       crossAxisAlignment:
                  //                                           CrossAxisAlignment
                  //                                               .start,
                  //                                       children: [
                  //                                         CustomText(
                  //                                           textText: snapshot
                  //                                               .data![index]
                  //                                               .events[index]
                  //                                               .name,
                  //                                           color: Colors.black,
                  //                                           fontSize: 18,
                  //                                           fontWeight:
                  //                                               FontWeight.w600,
                  //                                         ),
                  //                                         const SizedBox(
                  //                                           height: 5,
                  //                                         ),
                  //                                         SizedBox(
                  //                                           height: 370,
                  //                                           child: ListView
                  //                                               .builder(
                  //                                                   physics:
                  //                                                       const FixedExtentScrollPhysics(),
                  //                                                   itemCount:
                  //                                                       snapshot
                  //                                                           .data!
                  //                                                           .length,
                  //                                                   itemBuilder:
                  //                                                       (context,
                  //                                                           index) {
                  //                                                     return CustomText(
                  //                                                         textText: snapshot
                  //                                                             .data![
                  //                                                                 index]
                  //                                                             .events[
                  //                                                                 index]
                  //                                                             .details,
                  //                                                         color: Colors
                  //                                                             .black,
                  //                                                         fontSize:
                  //                                                             18);
                  //                                                   }),
                  //                                         )
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     );
                  //                   }),
                  //             ),
                  //           ],
                  //         );
                  //       }
                  //       return const Center(child: CircularProgressIndicator());
                  //     })
                ],
              ),
            ],
          )),
    );
  }
}
