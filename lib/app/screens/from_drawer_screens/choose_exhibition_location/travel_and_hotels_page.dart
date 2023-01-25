import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/widgets/custom_travel_and_hotels_company_name.dart';
import 'package:toy_app/my_icons_icons.dart';

class TravelAndHotelsPage extends StatelessWidget {
  const TravelAndHotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'السفر والفنادق', color: Colors.white, fontSize: 18),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.h),
                width: Get.width,
                height: Get.height,
                child: const CustomText(
                    textAlign: TextAlign.center,
                    textText:
                        'وفرنا لكم قائمة بافضل الشركات والعروض لشراء تذاكر السفر وافضل الفنادق وبعض الخدمات المساعدة اثناء اقامتكم',
                    color: Colors.black,
                    fontSize: 15),
              ),
            ),
            CustomCompanyName(),
            // SingleChildScrollView(scrollDirection: Axis.vertical,
            //   child:
            //   Expanded(
            //     child: SizedBox(
            //       height: Get.height -150,
            //       child: FutureBuilder(
            //           future: _travelsController.fetchTravels(),
            //           builder: (context, snapshot) {
            //             if(snapshot.hasData){
            //               return GridView.builder(
            //                   physics: const BouncingScrollPhysics(),
            //                   itemCount: snapshot.data!.length,
            //                   gridDelegate:
            //                   const SliverGridDelegateWithFixedCrossAxisCount(
            //                       crossAxisCount: 2),
            //                   itemBuilder: (context, index) {
            //                     return InkWell(
            //                         onTap: () {
            //                           Get.bottomSheet(CustomImageBottomSheet(
            //                             onPressed: () {},
            //                             image: CircleAvatar(
            //                                 radius: 51.r,
            //                                 backgroundColor:
            //                                 const Color(0xffF5F5F5),
            //                                 child: CircleAvatar(
            //                                   backgroundImage: NetworkImage(
            //                                       snapshot.data![index].image),
            //                                   radius: 49.r,
            //                                   // backgroundColor: Colors.red,
            //                                 )),
            //                             firstText: snapshot.data![index].name,
            //                             buttonText: 'حجز',
            //                             optionalWidget: IconButton(
            //                                 onPressed: () {
            //                                   Get.back();
            //                                 },
            //                                 icon: const Icon(
            //                                   MyIcons.exit,
            //                                   color: Color(0xffD4D4D4),
            //                                 )),
            //                             secondText: '',
            //                           ));
            //                         },
            //                         child: Container(
            //                           // color: Colors.red,
            //                           // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
            //                           height: 165.h,
            //                           padding: EdgeInsets.only(
            //                               left: 3.w, right: 3.w /*,bottom: 3.h*/),
            //                           width: 194.w,
            //                           child: Card(
            //                             elevation: 3,
            //                             shape: RoundedRectangleBorder(
            //                                 borderRadius:
            //                                 BorderRadius.circular(20)),
            //                             child: SizedBox(
            //                               width: 170.w,
            //                               // color: Colors.red,
            //                               child: Column(
            //                                 mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                                 crossAxisAlignment:
            //                                 CrossAxisAlignment.center,
            //                                 children: [
            //                                   CircleAvatar(
            //                                       radius: 51.r,
            //                                       backgroundColor:
            //                                       const Color(0xffF5F5F5),
            //                                       child: CircleAvatar(
            //                                         backgroundImage: NetworkImage(
            //                                             snapshot.data![index].image),
            //                                         radius: 49.r,
            //                                         // backgroundColor: Colors.red,
            //                                       )),
            //                                   CustomText(
            //                                       textText:
            //                                       snapshot.data![index].name,
            //                                       color: Colors.black,
            //                                       fontSize: 20)
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                           // ),
            //                         ));
            //                   });
            //
            //             }
            //             return const Center(child: CircularProgressIndicator());
            //           }),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
