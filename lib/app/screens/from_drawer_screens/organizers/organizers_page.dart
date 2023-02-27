import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/organizers_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/organizers/widgets/organizers_custom_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class OrganizersPage extends StatelessWidget {
  OrganizersPage({Key? key}) : super(key: key);

  final OrganizerController _organizerController =
      Get.put(OrganizerController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const CustomText(
                textText: 'المنظمين', color: Colors.white, fontSize: 18),
            elevation: 0.r,
            backgroundColor: const Color(0xff6D2B70),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body:

          SizedBox(
            // color: Colors.red,
            height: Get.height,
            child: FutureBuilder(
                future: _organizerController.fetchOrganizer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return
                            Container(
                                margin: EdgeInsets.only(
                                    left: 5.w, right: 5.w, top: 5.h),
                                child: Card(
                                  elevation: 3.r,
                                  // clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    // height: 500,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.transparent),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(15)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${snapshot.data![index].image}"),
                                                      fit: BoxFit.cover)),
                                            ),
                                            // Image(
                                            //     image: NetworkImage(
                                            //         "${snapshot.data!.image}"),height: 50,width: 50, fit: BoxFit.cover,),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                    textText: snapshot.data![index].name,
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: const [
                                            OrganizersCustomIconWithText(
                                                icon: MyIcons.phone,
                                                text: "organizer.phone",
                                                fontSize: 14),
                                            OrganizersCustomIconWithText(
                                                icon: MyIcons.message,
                                                text: "organizer.email",
                                                fontSize: 14),
                                          ],
                                        ),
                                        CustomText(
                                          textText: snapshot.data![index].details,
                                          color: Colors.black,
                                          fontSize: 16,
                                          // fontWeight: FontWeight.w400,
                                        ),
                                        const CustomText(
                                            textText: "الخدمات",
                                            color: Color(0xff911D74),
                                            fontSize: 16),
                                        SizedBox(
                                          width: Get.width,
                                          height: 75,
                                          child: ListView.builder(
                                              itemBuilder: (context, i) {
                                                return CustomText(
                                                    textText:
                                                    "${snapshot.data![index].organizers[i]}".isEmpty ? "There is no data" :
                                                    "${snapshot.data![index].organizers[i]}" ,
                                                    color: Colors.black,
                                                    fontSize: 16);
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 5.h, top: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: const [
                                              Icon(
                                                MyIcons.linkedin,
                                                color: Color(0xff911D74),
                                                size: 20,
                                              ),
                                              Icon(
                                                MyIcons.twitter,
                                                color: Color(0xff911D74),
                                                size: 20,
                                              ),
                                              Icon(
                                                MyIcons.instagram,
                                                color: Color(0xff911D74),
                                                size: 20,
                                              ),
                                              Icon(
                                                MyIcons.facebook,
                                                color: Color(0xff911D74),
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));

                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: 5.w, right: 5.w, top: 5.h),
                            //   child: Card(
                            //     elevation: 3.r,
                            //     // clipBehavior: Clip.antiAlias,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(15)),
                            //     child: Container(
                            //       margin: const EdgeInsets.all(10),
                            //       // height: 500,
                            //       child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Container(
                            //                 height: 50,
                            //                 width: 50,
                            //                 decoration: BoxDecoration(
                            //                     border: Border.all(
                            //                         color: Colors.transparent),
                            //                     borderRadius: BorderRadius.all(
                            //                         Radius.circular(15)),
                            //                     image: DecorationImage(
                            //                         image: NetworkImage(
                            //                             "${snapshot.data!.image}"),
                            //                         fit: BoxFit.cover)),
                            //               ),
                            //               // Image(
                            //               //     image: NetworkImage(
                            //               //         "${snapshot.data!.image}"),height: 50,width: 50, fit: BoxFit.cover,),
                            //               const SizedBox(
                            //                 width: 5,
                            //               ),
                            //               Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.center,
                            //                 children: [
                            //                   CustomText(
                            //                       textText: snapshot.data!.name,
                            //                       color: Colors.black,
                            //                       fontSize: 18),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //           Column(
                            //             children: const [
                            //               OrganizersCustomIconWithText(
                            //                   icon: MyIcons.phone,
                            //                   text: "organizer.phone",
                            //                   fontSize: 14),
                            //               OrganizersCustomIconWithText(
                            //                   icon: MyIcons.message,
                            //                   text: "organizer.email",
                            //                   fontSize: 14),
                            //             ],
                            //           ),
                            //           CustomText(
                            //             textText: snapshot.data!.details,
                            //             color: Colors.black,
                            //             fontSize: 16,
                            //             // fontWeight: FontWeight.w400,
                            //           ),
                            //           const CustomText(
                            //               textText: "الخدمات",
                            //               color: Color(0xff911D74),
                            //               fontSize: 16),
                            //           SizedBox(
                            //             width: Get.width,
                            //             height: 75,
                            //             child: ListView.builder(
                            //                 itemBuilder: (context, i) {
                            //               return CustomText(
                            //                   textText:
                            //                   "${snapshot.data!.organizers[i]}".isEmpty ? "There is no data" :
                            //                        "${snapshot.data!.organizers[i]}" ,
                            //                   color: Colors.black,
                            //                   fontSize: 16);
                            //             }),
                            //           ),
                            //           Container(
                            //             margin: EdgeInsets.only(
                            //                 bottom: 5.h, top: 10.h),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceAround,
                            //               children: const [
                            //                 Icon(
                            //                   MyIcons.linkedin,
                            //                   color: Color(0xff911D74),
                            //                   size: 20,
                            //                 ),
                            //                 Icon(
                            //                   MyIcons.twitter,
                            //                   color: Color(0xff911D74),
                            //                   size: 20,
                            //                 ),
                            //                 Icon(
                            //                   MyIcons.instagram,
                            //                   color: Color(0xff911D74),
                            //                   size: 20,
                            //                 ),
                            //                 Icon(
                            //                   MyIcons.facebook,
                            //                   color: Color(0xff911D74),
                            //                   size: 20,
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ));
                        });
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("NO DATA TO SHOW"),
                    );
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )),
    );
  }
}
