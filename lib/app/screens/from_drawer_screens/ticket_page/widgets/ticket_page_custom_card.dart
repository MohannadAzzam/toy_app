import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import '../../../../controllers/tickets_controller.dart';

class CustomTicketPageCard extends StatelessWidget {
  // final Ticket ticket;

  CustomTicketPageCard({Key? key /*, required this.ticket*/
      })
      : super(key: key);
  final TicketController _ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _ticketController.fetchItemEvent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 500,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                                width: (Get.width) * (7 / 10),
                                alignment: AlignmentDirectional.topStart,
                                margin:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: CustomText(
                                    textAlign: TextAlign.start,
                                    textText: snapshot.data![index].name,
                                    color: const Color(0xff911D74),
                                    fontSize: 20)),
                            Container(
                              width: (Get.width) * (7 / 10),
                              margin: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Badge(
                                    badgeColor: const Color(0xff911D74),
                                    padding: const EdgeInsets.all(20),
                                    badgeContent: Column(
                                      children: [
                                        CustomText(
                                            textText: snapshot
                                                .data![index].events[index].time
                                                .substring(0, 5),
                                            color: Colors.white,
                                            fontSize: 16),
                                      ],
                                    ),
                                    position: BadgePosition.topEnd(
                                        top: -25.h, end: 10.w),
                                    child: Card(
                                      elevation: 3.r,
                                      // clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 15.h, left: 20.w, right: 15.w),
                                        // height: 500,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              textText: snapshot.data![index]
                                                  .events[index].name,
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 370,
                                              child: ListView.builder(
                                                  physics:
                                                      const FixedExtentScrollPhysics(),
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return CustomText(
                                                        textText: snapshot
                                                            .data![index]
                                                            .events[index]
                                                            .details,
                                                        color: Colors.black,
                                                        fontSize: 18);
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
    //   Container(
    //   width: (Get.width) * (7 / 10),
    //   margin: EdgeInsets.only(
    //     left: 10.w,
    //     right: 10.w, /*top: 50*/
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         height: 25,
    //       ),
    //       Badge(
    //         badgeColor: Color(0xff911D74),
    //         padding: EdgeInsets.all(20),
    //         badgeContent: Column(
    //           children: [
    //             CustomText(
    //                 textText: ticket.timeNumber,
    //                 color: Colors.white,
    //                 fontSize: 16),
    //             CustomText(
    //                 textText: ticket.timeText,
    //                 color: Colors.white,
    //                 fontSize: 14),
    //           ],
    //         ),
    //         position: BadgePosition.topEnd(top: -25.h, end: 10.w),
    //         child: Card(
    //           elevation: 3.r,
    //           // clipBehavior: Clip.antiAlias,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Container(
    //             margin: EdgeInsets.only(top: 15.h, left: 20.w, right: 15.w),
    //             // height: 500,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 CustomText(
    //                   textText: ticket.eventName,
    //                   color: Colors.black,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 SizedBox(
    //                   // color: Colors.red,
    //                   height: 370,
    //                   child: ListView.builder(
    //                     physics: FixedExtentScrollPhysics(),
    //                     itemCount: eventList.length,
    //                     itemBuilder: (context, index) => CustomCardContent(
    //                         eventNum: eventNumList[index],
    //                         event: eventList[index]),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
