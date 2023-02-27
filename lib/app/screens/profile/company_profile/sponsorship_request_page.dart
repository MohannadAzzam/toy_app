import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_image_bottom_sheet.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/home/home_page.dart';
import 'package:toy_app/app/screens/profile/company_profile/edit_account_page.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_profile_data_unit.dart';
import 'package:toy_app/my_icons_icons.dart';

class SponsorshipRequestAccount extends StatelessWidget {
  const SponsorshipRequestAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        "نركو اختيار مساحة باقة الرعاية خاصة بكم من خلال الضغط على رز طلب رعاية ثم اختيار الباقة المرغوب بها";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() =>  HomePage());
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const EditCompanyAccountPage());
                },
                icon: const Icon(Icons.more_vert))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: const Color(0xff6d2b70),
                height: 200.h,
                // margin: EdgeInsets.only(top: 8.h),
                width: Get.width,
                child: Center(
                    child: Column(
                  children: [
                    CircleAvatar(
                        radius: 55.r,
                        backgroundColor: const Color(0xffF5F5F5),
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                              "assets/images/company_avatar.png"),
                          radius: 54.r,
                          // backgroundColor: Colors.red,
                        )),
                    const CustomText(
                        textText: 'اسم الشركة',
                        color: Colors.white,
                        fontSize: 18),
                  ],
                )),
              ),
              Column(
                children: const [
                  CustomProfileDataUnit(
                      icon: MyIcons.person, text: 'محمد عبد الله احمد'),
                  CustomProfileDataUnit(
                      icon: MyIcons.phone, text: '966123456789+'),
                  CustomProfileDataUnit(
                      icon: MyIcons.message, text: 'Mail@Website.com'),
                  CustomProfileDataUnit(
                      icon: MyIcons.location, text: 'السعودية'),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: const Divider(
                  thickness: 2,
                ),
              ),
              const CustomProfileDataUnit(
                  icon: MyIcons.store, text: 'بيانات باقة الرعاية'),
              Container(
                margin: EdgeInsets.only(left: 25.w, right: 25.w),
                child: CustomText(
                    textAlign: TextAlign.center,
                    textText: text,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 3.h,/* bottom: 12.h, left: 8.w, right: 8.w*/),
                height: 160.h,
                padding:
                    EdgeInsets.only(left: 3.w, right: 3.w /*,bottom: 3.h*/),
                width: 170.w,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 170.w,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Image(
                                image: AssetImage(
                                    "assets/images/diamond_sponsor.png")),
                            CustomText(
                                textText: "الراعي الماسي",
                                color: Colors.black,
                                fontSize: 14)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButtonWithIcon(
                  height: 60,
                  width: 200,
                  icon: MyIcons.sponsors,
                  text: "طلب رعاية",
                  top: 20,
                  bottom: 20,
                  left: 0,
                  right: 0,
                  onTap: () {
                    Get.bottomSheet(CustomImageBottomSheet(
                      image: const Image(
                        image: AssetImage("assets/images/work_space.png"),
                      ),
                      firstText: "تهانينا",
                      secondText: "تم طلب مساحة العمل بنجاح",
                      buttonText: "تم",
                      onPressed: () {
                        const CustomImageBottomSheet(
                            image: Image(
                                image: AssetImage(
                                    "assets/images/sponsor_package.png")),
                            firstText: "تهانينا",
                            secondText: "تم طلب باقة رعاية بنجاح",
                            buttonText: "تم");
                      },
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
