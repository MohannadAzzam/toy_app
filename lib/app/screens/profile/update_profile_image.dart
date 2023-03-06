import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toy_app/app/screens/profile/user_profile/widgets/custom_button_with_icon.dart';

import '../../../my_icons_icons.dart';
import '../../controllers/profile_data_controller.dart';
import '../../controllers/update_image_controller.dart';

class UpdateProfileImage extends StatelessWidget {
  const UpdateProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDataController = Get.put(ProfileDataController());
    final updateImageController = Get.put(UpdateImageController());

    return FutureBuilder(
        future: profileDataController.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InkWell(
            onTap: () {
              Get.bottomSheet(BottomSheet(
              backgroundColor: Colors.transparent,
              onClosing: () {},
              builder: (context) {
                return Container(
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 25.h, left: 30.w, right: 30.w),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  MyIcons.exit,
                                  color: Color(0xffD4D4D4),
                                ))),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                CustomButtonWithIcon(
                                    height: 60,
                                    width: 294,
                                    icon: Icons.camera,
                                    text:
                                    "التقاط صورة عن طريق الكاميرا",
                                    top: 20,
                                    bottom: 10,
                                    left: 0,
                                    right: 0,
                                    onTap: () {
                                      Get.back();
                                      updateImageController
                                          .updateImage(
                                          ImageSource.camera);
                                      // Get.to(() => EditPersonalDetails());
                                    }),
                                CustomButtonWithIcon(
                                    height: 60,
                                    width: 294,
                                    icon: Icons.image,
                                    text:
                                    "اختيار صورة من الاستوديو",
                                    top: 0,
                                    bottom: 10,
                                    left: 0,
                                    right: 0,
                                    onTap: () {
                                      Get.back();
                                      updateImageController
                                          .updateImage(
                                          ImageSource.gallery);
                                      // Get.to(() => const ChangePasswordPage());
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }));
            },
              child: CircleAvatar(
                radius: 55.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 54.r,
                  backgroundColor: const Color(0xff6D2B70),
                  backgroundImage: NetworkImage(snapshot.data!.image),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
