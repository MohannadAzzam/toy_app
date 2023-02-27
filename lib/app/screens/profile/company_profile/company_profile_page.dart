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

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileDataController profileDataController =
        Get.put(ProfileDataController());

    String text =
        "نرجو اختيار مساحة عمل خاصة بكم من خلال الضغط على رز حجز مساحة ثم اختيار رقم المساحة المرغوب بها";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.to(() => HomePage());
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
                                CircleAvatar(
                                    radius: 55.r,
                                    backgroundColor: const Color(0xffF5F5F5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data!.image),
                                      radius: 54.r,
                                      // backgroundColor: Colors.red,
                                    )),
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
                  icon: MyIcons.store, text: 'بيانات مساحة عمل'),
              Container(
                margin: EdgeInsets.only(left: 25.w, right: 25.w),
                child: CustomText(
                    textAlign: TextAlign.center,
                    textText: text,
                    color: Colors.black,
                    fontSize: 14),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 15.h, bottom: 15.h, right: 15.w, left: 15.w),
                width: 358.w,
                height: 172.h,
                decoration: const BoxDecoration(
                    color: Color(0xff911D74),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                            textText: "رقم مكان مساحة العمل",
                            color: Colors.white,
                            fontSize: 16),
                        SizedBox(
                          height: 25.h,
                        ),
                        const CustomText(
                            textText: "ابعاد مكان مساحة العمل",
                            color: Colors.white,
                            fontSize: 16),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 5.h),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText(
                                textText: "1",
                                color: Color(0xff911D74),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 5.h),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                textText: "1×9",
                                color: Color(0xff911D74),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const CustomText(
                                textText: "م",
                                color: Color(0xff911D74),
                                fontSize: 14,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CustomButtonWithIcon(
                  height: 60,
                  width: 200,
                  icon: MyIcons.store,
                  text: "حجز مساحة",
                  top: 20,
                  bottom: 20,
                  left: 0,
                  right: 0,
                  onTap: () {
                    Get.bottomSheet(CustomImageBottomSheet(
                      image: const Image(
                          image: AssetImage("assets/images/work_space.png")),
                      firstText: "تهانينا",
                      secondText: "تم طلب مساحة العمل بنجاح",
                      buttonText: "تم",
                      onPressed: () {},
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
