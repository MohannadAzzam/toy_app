import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text_form_field.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/widgets/drop_down_button_form_field.dart';
import 'package:toy_app/my_icons_icons.dart';

class EditPersonalDetails extends StatelessWidget {
  const EditPersonalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Get.bottomSheet(BottomSheet(
            //           backgroundColor: Colors.transparent,
            //           onClosing: () {},
            //           builder: (context) {
            //             return Container(
            //               height: 250.h,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   border: Border.all(color: Colors.transparent),
            //                   borderRadius: const BorderRadius.only(
            //                       topLeft: Radius.circular(20),
            //                       topRight: Radius.circular(20))),
            //               child: SingleChildScrollView(
            //                 scrollDirection: Axis.vertical,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Container(
            //                         margin: EdgeInsets.only(
            //                             top: 25.h, left: 30.w, right: 30.w),
            //                         child: IconButton(
            //                             onPressed: () {
            //                               Get.back();
            //                             },
            //                             icon: const Icon(
            //                               MyIcons.exit,
            //                               color: Color(0xffD4D4D4),
            //                             ))),
            //                     Directionality(
            //                       textDirection: TextDirection.rtl,
            //                       child: Container(
            //                         width: Get.width,
            //                         child: Column(
            //                           crossAxisAlignment: CrossAxisAlignment.center,
            //                           mainAxisAlignment: MainAxisAlignment.center,
            //                           children: [
            //                             CustomButtonWithIcon(
            //                                 height: 60,
            //                                 width: 294,
            //                                 icon: MyIcons.person,
            //                                 text: "تعديل البيانات الشخصية",
            //                                 top: 20,
            //                                 bottom: 10,
            //                                 left: 0,
            //                                 right: 0,
            //                                 onTap: () {}),
            //                             CustomButtonWithIcon(
            //                                 height: 60,
            //                                 width: 294,
            //                                 icon: MyIcons.locker,
            //                                 text: "تغيير كلمة المرور",
            //                                 top: 0,
            //                                 bottom: 10,
            //                                 left: 0,
            //                                 right: 0,
            //                                 onTap: () {}),
            //                           ],
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }));
            //     },
            //     icon: const Icon(Icons.more_vert))
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
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 54.r,
                        backgroundColor: const Color(0xff6D2B70),
                        child: Icon(
                          MyIcons.person,
                          color: Colors.white,
                          size: 50.r,
                        ),
                      ),
                    ),
                    const CustomText(
                        textText: 'تعديل البيانات الشخصية',
                        color: Colors.white,
                        fontSize: 18),
                  ],
                )),
              ),
              Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextFormField(
                        icon: MyIcons.person, hint: 'الاسم', isObscure: false),
                    CustomTextFormField(
                        icon: MyIcons.message,
                        hint: 'البريد الإلكتروني',
                        isObscure: false),
                    CustomTextFormField(
                        icon: MyIcons.message,
                        hint: 'رقم الجوال',
                        isObscure: false),
                    CustomDropDownButtonFormField()
                  ],
                ),
              ),
              CustomButton(
                  onPressed: () {},
                  bottomMargin: 10,
                  topMargin: 30,
                  height: 60,
                  width: 200,
                  text: "حفظ",
                  rightMargin: 0,
                  leftMargin: 0)
            ],
          ),
        ),
      ),
    );
  }
}
