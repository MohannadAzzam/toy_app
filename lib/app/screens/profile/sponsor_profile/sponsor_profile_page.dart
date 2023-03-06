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

import '../../../controllers/profile_data_controller.dart';
import '../update_profile_image.dart';

class SponsorProfilePage extends StatelessWidget {
  const SponsorProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileDataController profileDataController =
    Get.put(ProfileDataController());
    // final updateImageController = Get.put(UpdateImageController());


    String text =
        "شكرا لثقتكم الغالية, لقد تم حجز مساحة عمل خاصة بكم كما هوا موضح بالاسفل";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => const HomePage());
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

                    child: FutureBuilder(
                        future: profileDataController.getUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                const UpdateProfileImage(),

                                SizedBox(
                                  height: 20.h,
                                ),
                                 CustomText(
                                    textText: snapshot.data!.name,
                                    color: Colors.white,
                                    fontSize: 18),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        })),
              ),
              FutureBuilder(
                  future: profileDataController.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          CustomProfileDataUnit(
                              icon: MyIcons.person,
                              text: snapshot.data!.name),
                          CustomProfileDataUnit(
                              icon: MyIcons.phone,
                              text: snapshot.data!.mobile),
                          CustomProfileDataUnit(
                              icon: MyIcons.message,
                              text: snapshot.data!.email),
                          CustomProfileDataUnit(
                              icon: MyIcons.location,
                              text: snapshot.data!.countryName),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: const Divider(
                  thickness: 2,
                ),
              ),
              const CustomProfileDataUnit(
                  icon: MyIcons.sponsors, text: "بيانات باقة الرعاية"),
              Container(
                margin: EdgeInsets.only(left: 25.w, right: 25.w),
                child: CustomText(
                    textAlign: TextAlign.center,
                    textText: text,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(height: 30,),
              Card(
                elevation: 2,
                shape:
                RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xffF0F0F0)),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    // Container(
                    //   alignment: Alignment.topRight,
                    //   margin: EdgeInsets.only(left: 16.w, right: 15.w, top: 30.h),
                    //   child: CustomText(
                    //       textText: '${sponsorPackages.sponsorId}',
                    //       color: const Color(0xffC1C1C1),
                    //       fontSize: 16),
                    // ),
                    SizedBox(
                      width: 170.w,
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage("assets/images/golden_sponsor.png")),
                          CustomText(
                              textText: "الراعي الذهبي",
                              color: Colors.black,
                              fontSize: 16)
                        ],
                      ),
                    ),
                  ],
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
                          image: AssetImage("assets/images/sponsor_package.png")),
                      firstText: "تهانينا",
                      secondText: "تم طلب باقة الرعاية بنجاح",
                      buttonText: "تم",
                      onPressed: () {
                        Get.back();
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

// CustomImageBottomSheet(
// image: Image(image: AssetImage("assets/images/work_space.png")),
// firstText: "تهانينا",
// secondText: "تم طلب مساحة العمل بنجاح",
// buttonText: "تم")
