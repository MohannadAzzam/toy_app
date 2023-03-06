import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/widgets/custom_travel_and_hotels_company_name.dart';

class TravelAndHotelsPage extends StatelessWidget {
  const TravelAndHotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: "travelAndHotel", color: Colors.white, fontSize: 18),
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5.h,right: 5.h,left: 5.h),
              width: Get.width,
              height: Get.height,
              child: const CustomText(
                  textAlign: TextAlign.center,
                  textText:
                      "travelUp",
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
          CustomCompanyName(),
        ],
      ),
    );
  }
}
