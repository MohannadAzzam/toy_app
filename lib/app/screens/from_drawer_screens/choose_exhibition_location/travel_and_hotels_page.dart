import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/travel_and_hotels_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
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
              Get.to(() => const ChooseExhibitionLocationPage());
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all( 5.h),
                width: Get.width,
                child: const CustomText(
                    textAlign: TextAlign.center,
                    textText:
                    'وفرنا لكم قائمة بافضل الشركات والعروض لشراء تذاكر\nالسفر وافضل الفنادق وبعض الخدمات المساعدة اثناء اقامتكم',
                    color: Colors.black,
                    fontSize: 14),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 3.w, right: 3.w/*, bottom: 8.h*/),
              //   child: InkWell(
              //     onTap: () {
              //       // Get.to(()=>FullExhibitionMapPage());
              //       print(Get.height);
              //     },
              //     child: const Image(
              //       image: AssetImage('assets/images/exhibition_map.png'),
              //     ),
              //   ),
              // ),
              Container(
                height: 600.h,
                // height:Get.height,
                // width: 170.w,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:  travelAndHotelsList.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    itemBuilder: (context, index) {
                      return CustomCompanyName(travelAndHotels: travelAndHotelsList[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

