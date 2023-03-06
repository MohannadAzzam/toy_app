import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/travels_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomCompanyName extends StatelessWidget {
  // final TravelAndHotels travelAndHotels;

  CustomCompanyName({Key? key /*, required this.travelAndHotels*/
      })
      : super(key: key);
  final TravelsController _travelsController = Get.put(TravelsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: SizedBox(
          height: Get.height - 150,
          child: FutureBuilder(
              future: _travelsController.fetchTravels(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Get.bottomSheet(CustomImageBottomSheet(
                                onPressed: () {},
                                image: CircleAvatar(
                                    radius: 51.r,
                                    backgroundColor: const Color(0xffF5F5F5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data![index].image),
                                      radius: 49.r,
                                      // backgroundColor: Colors.red,
                                    )),
                                firstText: snapshot.data![index].name,
                                buttonText: 'حجز',
                                optionalWidget: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      MyIcons.exit,
                                      color: Color(0xffD4D4D4),
                                    )),
                                secondText: '',
                              ));
                            },
                            child: Container(
                              // color: Colors.red,
                              // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
                              height: 165.h,
                              padding: EdgeInsets.only(
                                  left: 3.w, right: 3.w /*,bottom: 3.h*/),
                              width: 194.w,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: SizedBox(
                                  width: 170.w,
                                  // color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 51.r,
                                          backgroundColor:
                                              const Color(0xffF5F5F5),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                snapshot.data![index].image),
                                            radius: 49.r,
                                            // backgroundColor: Colors.red,
                                          )),
                                      CustomText(
                                          textText: snapshot.data![index].name,
                                          color: Colors.black,
                                          fontSize: 20)
                                    ],
                                  ),
                                ),
                              ),
                              // ),
                            ));
                      });
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
    // InkWell(
    //   onTap: () {
    //     Get.bottomSheet(CustomImageBottomSheet(
    //         onPressed: (){
    //
    //         },
    //       image: CircleAvatar(
    //           radius: 51.r,
    //           backgroundColor: const Color(0xffF5F5F5),
    //           child: CircleAvatar(
    //             backgroundImage:
    //                 AssetImage(travelAndHotels.companyAvatar),
    //             radius: 49.r,
    //             // backgroundColor: Colors.red,
    //           )),
    //       firstText: travelAndHotels.companyName,
    //       buttonText: 'حجز',
    //       optionalWidget: IconButton(
    //           onPressed: () {
    //             Get.back();
    //           },
    //           icon: const Icon(
    //             MyIcons.exit,
    //             color: Color(0xffD4D4D4),
    //           )),
    //       secondText: '',
    //     ));
    //   },
    //   child: Container(
    //     // color: Colors.red,
    //     // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
    //     height: 165.h,
    //     padding: EdgeInsets.only(left: 3.w, right: 3.w /*,bottom: 3.h*/),
    //     width: 194.w,
    //     child: Card(
    //       elevation: 3,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       child: Stack(
    //         children: [
    //           SizedBox(
    //             width: 170.w,
    //             // color: Colors.red,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 CircleAvatar(
    //                     radius: 51.r,
    //                     backgroundColor: const Color(0xffF5F5F5),
    //                     child: CircleAvatar(
    //                       backgroundImage:
    //                           AssetImage(travelAndHotels.companyAvatar),
    //                       radius: 49.r,
    //                       // backgroundColor: Colors.red,
    //                     )),
    //                 CustomText(
    //                     textText: travelAndHotels.companyName,
    //                     color: Colors.black,
    //                     fontSize: 20)
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     // ),
    //   ));
  }
}
