import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/place_radio_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/choose_package_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/full_exhibition_map_page.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/widgets/custom_radio_list_tile.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class ChooseExhibitionLocationPage extends StatelessWidget {
  const ChooseExhibitionLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'اختر مكان المعرض', color: Colors.white, fontSize: 18),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const HomePage());
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
                        'اختر من الخريطة موقع معرضك حسب الرقم ثم\nاختاره من القائمة في الاسفل',
                    color: Colors.black,
                    fontSize: 14),
                Container(
                  margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 8.h),
                  child:  InkWell(
                      onTap: (){
                          Get.to(()=>const FullExhibitionMapPage());
                      },
                    child: const Image(
                      image: AssetImage('assets/images/exhibition_map.png'),
                    ),
                  ),
                ),
                SizedBox(
                  // padding: EdgeInsets.only(left: 20.h,right:  20.h),
                  height: 500,
                  child: ListView.builder(
                    physics: const FixedExtentScrollPhysics(),
                      itemCount: placeRadioList.length,
                      itemBuilder: (context,index){
                    return CustomRadioListTile(placeRadio: placeRadioList[index]);
                  }),
                ),
                CustomButton(
                    onPressed: () {
                      Get.to(()=> const ChoosePackagePage());
                    },
                    bottomMargin: 18,
                    topMargin: 0,
                    height: 60,
                    width: 200,
                    text: 'تسجيل',
                    rightMargin: 0,
                    leftMargin: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
