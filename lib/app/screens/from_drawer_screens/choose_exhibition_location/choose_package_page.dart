import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../auth/login/widgets/custom_text.dart';

class ChoosePackagePage extends StatelessWidget {
  const ChoosePackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'اختر الباقة', color: Colors.white, fontSize: 18),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const ChooseExhibitionLocationPage());
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8.h),
          width: Get.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const CustomText(
                    textAlign: TextAlign.center,
                    textText:
                    'اختر الباقة حسب ما يظهر بالخريطة الاماكن التي\nتخص الراعي حسب اللون',
                    color: Colors.black,
                    fontSize: 14),
                Container(
                  margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 8.h),
                  child:  InkWell(
                    onTap: (){
                      // Get.to(()=>FullExhibitionMapPage());
                    },
                    child: Image(
                      image: AssetImage('assets/images/exhibition_map.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
