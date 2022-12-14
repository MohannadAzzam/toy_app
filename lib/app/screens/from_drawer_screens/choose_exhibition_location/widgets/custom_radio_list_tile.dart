import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/choose_exhibition_location_page_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomRadioListTile extends StatelessWidget {
  final int value;
  final String placeNumber;
  final String placeArea;
  const CustomRadioListTile({Key? key, required this.value, required this.placeNumber, required this.placeArea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: 336.w,
      // height: 67,
      child: GetBuilder<ChooseExhibitionLocationPageController>

        (
          init: ChooseExhibitionLocationPageController(),
          builder: (controller) =>
              RadioListTile(
                  selectedTileColor: const Color(0xffF5F5F5),
                  tileColor: const Color(0xffF5F5F5),
                  selected: controller.isSelected,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: controller.selectedPlace == value
                            ? const Color(0xff911D74)
                            : const Color(0xffF5F5F5)
                    ),

                    borderRadius: const BorderRadius.all(Radius.circular(
                        10)),
                  ),
                  activeColor: Colors.purple,
                  title: Row(
                    children: [
                      const CustomText(
                          textText: 'المكان',
                          color: Color(0xffC1C1C1),
                          fontSize: 12),
                      const SizedBox(
                        width: 2,
                      ),
                      CustomText(
                          textText: placeNumber,
                          color: Colors.black,
                          fontSize: 16),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        // color: Colors.red,
                        height: 31.h,
                        child: const VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          const CustomText(
                              textText: 'المساحة',
                              color: Color(0xffC1C1C1),
                              fontSize: 12),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                              textText: placeArea,
                              color: Colors.black,
                              fontSize: 16),
                        ],
                      )
                    ],
                  ),
                  value: value,
                  groupValue: controller.selectedPlace,
                  onChanged: (value) {
                    controller.changeSelectedPlace(value);
                  }))
      ,
    );
  }
}
