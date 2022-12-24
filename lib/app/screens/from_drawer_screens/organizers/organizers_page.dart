import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/organizer_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/organizers/widgets/organizer_custom_card.dart';
import 'package:toy_app/my_icons_icons.dart';

class OrganizersPage extends StatelessWidget {
  const OrganizersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'المنظمين', color: Colors.white, fontSize: 18),
          elevation: 0.r,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body:

        ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: organizersList.length,
            itemBuilder: (context,index) =>
        CustomOrganizerCard(organizer: organizersList[index])
        ),
      ),
    );
  }


}