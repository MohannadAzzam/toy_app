import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/sponsor_packages_list.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/full_exhibition_map_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/widgets/custom_choose_package_grid.dart';
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
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: Get.width,
                child: const CustomText(
                    textAlign: TextAlign.center,
                    textText:
                        'اختر الباقة حسب ما يظهر بالخريطة الاماكن التي\nتخص الراعي حسب اللون',
                    color: Colors.black,
                    fontSize: 14),
              ),
              Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w/*, bottom: 8.h*/),
                child: InkWell(
                  onTap: () {
                    Get.to(()=>FullExhibitionMapPage());
                    // print(Get.height);
                  },
                  child: const Image(
                    image: AssetImage('assets/images/exhibition_map.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 410.h,
                // height:Get.height,
                // width: 170.w,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:  sponsorPackagesList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CustomChoosePackageGrid(
                          sponsorPackages: sponsorPackagesList[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
